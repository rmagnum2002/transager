namespace :import do
  desc 'Sync parts'
  task sync_parts: :environment do
    sync_parts
  end

  desc "Import parts from csv file"
  task :parts => :environment do
    require 'csv'
    csv_text = File.read("#{Rails.root}/db/seed/parts.csv")

    csv = CSV.parse(csv_text, :headers => true)
    parts = []
    progressbar = ProgressBar.create(:starting_at => 0, :total => csv.count, format: '%a %B %p%% %t')
    # "970.85".gsub(/[^0-9]/,'').to_i / 100.00
    Part.delete_all
    csv.each do |row|
      if row[2].present?
        parts << Part.create(
          manufacturer_id: row[0],
          seller_id: row[1],
          name: row[2],
          price: (row[3].present? ? row[3].gsub(/[^0-9]/,'').to_i / 100.00 : nil),
          winter: row[4].present? ? (row[4] == 0 ? false : true) : nil,
          truck: row[5].present? ? (row[5] == 0 ? false : true) : nil,
          brand: (row[6] if row[6].present?),
          category_id: (row[7].present? ? row[7] : 0),
          truck_id: (row[8].present? ? row[8] : 0),
          order: (row[9].present? ? row[9] : 0)
        )
        progressbar.increment
      end
    end
    p "Parts 1 imported - #{parts.count}"
  end

  desc "Update parts data"
  task :update_parts => :environment do
    Part.where("name ILIKE ?", "%Сайленблок%").update_all(category_id: 14)
    Part.where("name ILIKE ?", "%Колодка тормозная%").update_all(category_id: 13)
    Part.where("name ILIKE ?", "%Насос подьема кабины%").update_all(category_id: 23)
    Part.where("name ILIKE ?", "%Насос подьема кабины%").where("name ILIKE ?", "%Volvo%").update_all(truck_id: 3)
    Part.where("name ILIKE ?", "%Фара%").update_all(category_id: 16)
    Part.where("name ILIKE ?", "%Scania%").where(category_id: 22).update_all(truck_id: 4)
    Part.where("name ILIKE ?", "%Renault%").where(category_id: 22).update_all(truck_id: 10)
    Part.where("name ILIKE ?", "%Iveco%").where(category_id: 22).update_all(truck_id: 6)
    Part.where("name ILIKE ?", "%DAF%").where(category_id: 22).update_all(truck_id: 5)
    Part.where("name ILIKE ?", "%Atego%").where(category_id: 22).update_all(truck_id: 1)
    Part.where("name ILIKE ?", "%Axor%").where(category_id: 22).update_all(truck_id: 1)
    Part.where("name ILIKE ?", "%Actros%").where(category_id: 22).update_all(truck_id: 1)
    Part.where("name ILIKE ?", "%Volvo%").where(category_id: 22).update_all(truck_id: 3)
    p "Parts updated"
  end

  task :all => [:parts, :update_parts]

  def sync_parts
    p "ENDPOINT #{ENV['DATA_HOST']}/trans/hs/getgoods/"
    uri = URI.parse("#{ENV['DATA_HOST']}/trans/hs/getgoods/")
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.request_uri)
    request.basic_auth(ENV['DATA_HOST_USERNAME'], ENV['DATA_HOST_PASSWORD'])
    response = http.request(request)
    parts = JSON.parse(response.body)
    progressbar = ProgressBar.create(starting_at: 0, total: parts.count, format: '%a %B %p%% %t')
    return unless parts.any?

    parts.each do |p|
      part = Part.where(internal_id: p['internal_id']).first
      if part
        part.seller_id = p['seller_id']
        part.manufacturer_id = p['manufacturer_id']
        part.name = p['title']
        part.save
      else
        Part.new(
          internal_id: p['internal_id'],
          seller_id: p['seller_id'],
          manufacturer_id: p['manufacturer_id'],
          name: p['title']
        ).save
      end
      progressbar.increment
    end
    p "Sync Finsihed. Synced #{parts.count} parts"
  end
end

# desc "Import tires"
# task :import => 'import:all'
