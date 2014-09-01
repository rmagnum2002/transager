class Page < ActiveRecord::Base
  belongs_to :gallery

  PAGE_TYPE = {
    :"page_type.root" => 1,
    :"page_type.transport" => 2,
    :"page_type.service" => 3,
    :"page_type.shop" => 4,
    :"page_type.contacts" => 5
  }

  def to_param
    "#{id}-#{link_name}".parameterize
  end
end
