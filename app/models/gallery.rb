class Gallery < ActiveRecord::Base
  has_many :gallery_items, :dependent => :destroy
  has_many :pages
  validates :name, presence: true
end
