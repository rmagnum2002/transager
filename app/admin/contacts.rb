ActiveAdmin.register Contact do


  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :contact_type, :department_id, :details, :on, :contact
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
    column :contact_type do |c|
      t(Contact::CONTACT_TYPE.invert[c.contact_type])
    end
    column :details
    column :created_at
    column :updated_at

    actions
  end

  show do
    attributes_table do
      row :id
      row :contact_type do
        t(Contact::CONTACT_TYPE.invert[contact.contact_type])
      end
      row :department_id do
        t(Contact::DEPARTMENT_ID.invert[contact.department_id])
      end
      row :details
    end
    active_admin_comments
  end

  form do |f|
    f.inputs 'Contact' do
      f.input :contact_type, as: :select, collection: Contact::CONTACT_TYPE.map{|value, key| [t(value), key] }
      f.input :department_id, as: :select, collection: Contact::DEPARTMENT_ID.map{|value, key| [t(value), key] }
      f.input :details
    end
    f.actions
  end

end
