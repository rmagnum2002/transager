class Part < ActiveRecord::Base
  include PgSearch
  pg_search_scope :quick_search,
                  :against => [:name, :manufacturer_id, :seller_id],
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
    13 => :"parts.brake_pads"
  }

  def category_name
    Part::CATEGORY[self.category_id]
  end
end
