ActiveAdmin.register AppSetting do
  actions :all, except: [:new, :destroy]

  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :slider_option, :map_option, :enable_chat, :include_suppliers,
            :root_page_parts_count, :phone, :email, :keywords, :description, :contact_form, on: :app_setting
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

  form do |f|
    f.inputs 'App Settings' do
      f.input :slider_option, label: 'Collapsing header'
      # f.input :map_option
      f.input :enable_chat
      f.input :include_suppliers
      f.input :contact_form
      f.input :root_page_parts_count, label: 'Root page parts count (1, 2, 3, 4, 6)'
      f.input :phone, label: 'Phone for contact page'
      f.input :email, label: 'Email for contact page'
    end
    f.inputs 'Seo' do
      f.input :keywords
      f.input :description
    end
    f.actions
  end

end
