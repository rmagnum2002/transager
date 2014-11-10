namespace :import do
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

  # desc "Import parts 2 from csv file"
  # task :parts_2 => :environment do
  #   require 'csv'
  #   csv_text = File.read("#{Rails.root}/db/seed/parts2.csv")

  #   csv = CSV.parse(csv_text, :headers => true)
  #   parts = []
  #   progressbar = ProgressBar.create(:starting_at => 0, :total => csv.count, format: '%a %B %p%% %t')
  #   # "970.85".gsub(/[^0-9]/,'').to_i / 100.00
  #   csv.each do |row|
  #     if row[2].present?
  #       parts << Part.create(manufacturer_id: row[0], name: row[2],
  #         seller_id: row[1], price: row[3].gsub(/[^0-9]/,'').to_i / 100.00,
  #         winter: row[4].present? ? (row[4] == 0 ? false : true) : nil,
  #         truck: row[5].present? ? (row[5] == 0 ? false : true) : nil,
  #         brand: (row[6] if row[6].present?), category_id: row[7])
  #       progressbar.increment
  #     end
  #   end
  #   p "Parts 2 imported - #{parts.count}"
  # end

  # desc "Import parts 3 from csv file"
  # task :parts_3 => :environment do
  #   require 'csv'
  #   csv_text = File.read("#{Rails.root}/db/seed/parts3.csv")

  #   csv = CSV.parse(csv_text, :headers => true)
  #   parts = []
  #   progressbar = ProgressBar.create(:starting_at => 0, :total => csv.count, format: '%a %B %p%% %t')
  #   # "970.85".gsub(/[^0-9]/,'').to_i / 100.00
  #   csv.each do |row|
  #     if row[2].present?
  #       parts << Part.create(manufacturer_id: row[0], name: row[2],
  #         seller_id: row[1], price: row[3].gsub(/[^0-9]/,'').to_i / 100.00,
  #         winter: row[4].present? ? (row[4] == 0 ? false : true) : nil,
  #         truck: row[5].present? ? (row[5] == 0 ? false : true) : nil,
  #         brand: (row[6] if row[6].present?), category_id: row[7])
  #       progressbar.increment
  #     end
  #   end
  #   p "Parts 3 imported - #{parts.count}"
  # end


  task :all => [:parts]
end

# desc "Import tires"
# task :import => 'import:all'
