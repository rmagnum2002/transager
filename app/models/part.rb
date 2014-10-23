class Part < ActiveRecord::Base
  # categories 1 - tires, 2 - batteries
  CATEGORY = {
    1 => "Tires",
    2 => "Batteries"
  }
end
