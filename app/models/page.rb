class Page < ActiveRecord::Base
  belongs_to :gallery
  attr_accessor :remove_header_image

  has_attached_file :header_image
  validates_attachment_content_type :header_image, :content_type => /\Aimage\/.*\Z/
  validates :header_image, dimensions: { width: 1920, height: 480 }, on: :create

  PAGE_TYPE = {
    :"page_type.root" => 1,
    :"page_type.transport" => 2,
    :"page_type.service" => 3,
    :"page_type.shop" => 4,
    :"page_type.contacts" => 5
  }

  before_save :delete_image, if: ->{ remove_header_image == '1' && !header_image_updated_at_changed? }

  def to_param
    "#{id}-#{link_name}".parameterize
  end

  private

  def delete_image
    self.header_image = nil
  end
end
