ActiveAdmin.register Part do
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :name, :images
  permit_params :name, :price, :manufacturer_id, :seller_id, :winter, :truck, :brand, :category_id
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

  form do |f|
    f.inputs 'Part' do
      f.input :manufacturer_id
      f.input :seller_id
      f.input :category_id, as: :select, collection: Part::CATEGORY.invert.map{|value, key| [t(value), key] }
      f.input :brand
      f.input :truck
      f.input :price
    end
    f.actions
  end

  filter :category_id, as: :select, collection: Part::CATEGORY.invert.to_a
  filter :name
  filter :manufacturer_id
  filter :seller_id
  filter :price
  filter :winter
  filter :truck
  filter :brand
end
