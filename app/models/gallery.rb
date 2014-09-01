class Gallery < ActiveRecord::Base
  has_many :gallery_items, :dependent => :destroy
  validates :name, presence: true
end
