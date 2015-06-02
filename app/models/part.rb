class Part < ActiveRecord::Base
  include PgSearch
  pg_search_scope :quick_search,
                  :against => [:name, :manufacturer_id, :seller_id, :brand],
                  ignoring: :accents, :using => {
                    :tsearch => {:prefix => true},
                    :trigram => {:threshold => 0.5}
                  }

  scope :other, -> {where category_id: 0}
  scope :tires, -> {where category_id: 1}
  scope :batteries, -> {where category_id: 2}
  scope :truck_filters, -> {where category_id: 3}
  scope :car_filters, -> {where category_id: 4}
  scope :repair_kits, -> {where category_id: 5}
  scope :brake_discs, -> {where category_id: 6}
  scope :tie_rod, -> {where category_id: 7}
  scope :oil_seals, -> {where category_id: 8}
  scope :compressors, -> {where category_id: 9}
  scope :filter_drier, -> {where category_id: 10}
  scope :brake_drums, -> {where category_id: 11}
  scope :hubs, -> {where category_id: 12}
  scope :brake_pads, -> {where category_id: 13}
  scope :bushings, -> {where category_id: 14}
  scope :level_valve, -> {where category_id: 15}
  scope :lights, -> {where category_id: 16}
  scope :reflectors, -> {where category_id: 17}
  scope :pneumatics, -> {where category_id: 18}
  scope :electric_parts, -> {where category_id: 19}
  scope :cardan_joint, -> {where category_id: 20}
  scope :radiator, -> {where category_id: 21}
  scope :cab, -> {where category_id: 22}
  scope :cab_pump, -> {where category_id: 23}

  CATEGORY = {
    0 => :"parts.other",
    1 => :"parts.tires",
    2 => :"parts.batteries",
    3 => :"parts.truck_filters",
    4 => :"parts.car_filters",
    5 => :"parts.repair_kits",
    6 => :"parts.brake_discs",
    7 => :"parts.tie_rod",
    8 => :'parts.oil_seals',
    9 => :"parts.compressors",
    10 => :"parts.filter_drier",
    11 => :'parts.brake_drums',
    12 => :"parts.hubs",
    13 => :"parts.brake_pads",
    14 => :"parts.bushings",
    15 => :"parts.level_valve",
    16 => :"parts.lights",
    17 => :"parts.reflectors",
    18 => :"parts.pneumatics",
    19 => :"parts.electric_parts",
    20 => :"parts.cardan_joint",
    21 => :"parts.radiator",
    22 => :"parts.cab",
    23 => :"parts.cab_pump"
  }

  TRUCK = {
    0 => :"parts.other",
    1 => 'Mercedes',
    2 => 'MAN',
    3 => 'Volvo',
    4 => 'Scania',
    5 => 'DAF',
    6 => 'IVECO',
    7 => 'BPW',
    8 => 'SAF',
    9 => 'ROR',
    10 => 'Renault'
  }

  def truck_name
    Part::TRUCK[self.truck_id]
  end

  def category_name
    Part::CATEGORY[self.category_id]
  end
end
