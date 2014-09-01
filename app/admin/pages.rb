ActiveAdmin.register Page do


  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :link_name, :title, :text_1, :page_type, :locale, :on, :contact, :gallery_id
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

  show do |page|
    attributes_table do
      row :title
      row :link_name
      row :locale
      row :page_type do
        t(Page::PAGE_TYPE.invert[page.page_type])
      end
      row :text_1 do
        raw(page.text_1)
      end
    end
    panel 'Gallery' do
      render 'admin/galleries/images', gallery: page.gallery if page.gallery.present?
    end
    active_admin_comments
  end

  form do |f|
    f.inputs 'Contact' do
      f.input :title
      f.input :link_name
      f.input :page_type, as: :select, collection: Page::PAGE_TYPE.map{|value, key| [t(value), key] }
      f.input :locale, as: :select, collection: LOCALES.to_a
      f.input :text_1, :as => :ckeditor
      f.input :gallery_id, as: :select, collection: Gallery.all.map{|g| [g.name, g.id]}
    end
    f.actions
  end

end
