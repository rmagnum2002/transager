class Part < ActiveRecord::Base
  include PgSearch
  pg_search_scope :quick_search,
                  :against => [:name, :manufacturer_id, :seller_id],
                  ignoring: :accents, :using => {
                    :tsearch => {:prefix => true},
                    :trigram => {:threshold => 0.5}
                  }

  scope :tires, -> {where category_id: 1}
  scope :batteries, -> {where category_id: 2}
  scope :truck_filters, -> {where category_id: 3}
  scope :car_filters, -> {where category_id: 4}

  # categories: 1 - tires, 2 - batteries, 3 - truck filter, 4 - car filter
  CATEGORY = {
    1 => "Tires",
    2 => "Batteries",
    3 => 'Truck Filters',
    4 => 'Car Filters'
  }
end
