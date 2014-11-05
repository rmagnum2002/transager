ActiveAdmin.register AppSetting do


  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :slider_option, :map_option, :enable_chat, :on, :app_setting
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

  # form do |f|
  #   f.inputs 'Contact' do
  #     f.input :contact_type, as: :select, collection: Contact::CONTACT_TYPE.map{|value, key| [t(value), key] }
  #     f.input :department_id, as: :select, collection: Contact::DEPARTMENT_ID.map{|value, key| [t(value), key] }
  #     f.input :details
  #   end
  #   f.actions
  # end

end
