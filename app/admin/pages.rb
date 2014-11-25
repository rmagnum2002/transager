ActiveAdmin.register Page do


  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :link_name, :title, :text_1, :text_2, :text_3, :page_type,
                :locale, :gallery_id, :keywords, :description, :header_image,
                :remove_header_image, :show_contacts, on: :page
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

  index do
    selectable_column
    column :id
    column :title
    column :link_name
    column :updated_at
    actions
  end

  show do |page|
    attributes_table do
      row :title
      row :header_image do
        image_tag(page.header_image.url, height: '200px')
      end
      row :description
      row :link_name
      row :locale
      row :page_type do
        t(Page::PAGE_TYPE.invert[page.page_type])
      end
      row :text_1 do
        raw(page.text_1)
      end
      if page.page_type == 1
        row :text_2 do
          raw(page.text_2)
        end
        row :text_3 do
          raw(page.text_3)
        end
      end
      row :keywords
      row :show_contacts
    end
    panel 'Gallery' do
      render 'admin/galleries/images', gallery: page.gallery if page.gallery.present?
    end
    active_admin_comments
  end

  form do |f|
    f.inputs 'Contact' do
      f.input :header_image
      f.input :remove_header_image, :as => :boolean
      f.input :title
      f.input :description
      f.input :link_name
      f.input :page_type, as: :select, collection: Page::PAGE_TYPE.map{|value, key| [t(value), key] }
      f.input :locale, as: :select, collection: LOCALES.to_a
      f.input :show_contacts
      f.input :text_1, :as => :ckeditor
      if page.page_type == 1
        f.input :text_2
        f.input :text_3
      end
    end
    f.inputs 'Gallery' do
      f.input :gallery_id, as: :select, collection: Gallery.all.map{|g| [g.name, g.id]}
    end
    f.inputs 'Seo' do
      f.input :keywords
    end
    f.actions
  end

end
