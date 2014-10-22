namespace :import do
  desc "Import tires from csv file"
  task :tires => :environment do
    require 'csv'
    csv_text = File.read("#{Rails.root}/db/seed/tires.csv")

    csv = CSV.parse(csv_text, :headers => true)
    tires = []
    # "970.85".gsub(/[^0-9]/,'').to_i / 100.00
    csv.each do |row|
      if row[2].present?
      tires << Tire.create(manufacturer_id: row[0], name: row[2],
        seller_id: row[1], price: row[3].gsub(/[^0-9]/,'').to_i / 100.00,
        winter: (row[4] == 0 ? false : true),
        truck: (row[5] == 0 ? false : true),
        brand: row[6])
      end
    end
    p "Tires imported - #{tires.count}"
  end

  task :all => [:tires]
end

# desc "Import tires"
# task :import => 'import:all'
