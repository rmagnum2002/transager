ActiveAdmin.register Part do
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :name, :images
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

  filter :category_id, as: :select, collection: Part::CATEGORY.invert.to_a
  filter :name
  filter :manufacturer_id
  filter :seller_id
  filter :price
  filter :winter
  filter :truck
  filter :brand
end
