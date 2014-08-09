ActiveAdmin.register Page do


  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :link_name, :title, :text_1, :page_type, :locale, :on, :contact
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

  index do
    column :id
    column :title
    column :link_name
    column :updated_at
    actions
  end

  form do |f|
    f.inputs 'Contact' do
      f.input :title
      f.input :link_name
      f.input :page_type, as: :select, collection: Page::PAGE_TYPE.map{|value, key| [t(value), key] }
      f.input :locale, as: :select, collection: LOCALES.to_a
      f.input :text_1
    end
    f.actions
  end

end
