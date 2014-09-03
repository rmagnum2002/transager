ActiveAdmin.register Feedback do
   actions :index, :show, :destroy

  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :contact_type, :department_id, :details, :on, :contact
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
    column :department_id do |c|
      t(Contact::DEPARTMENT_ID.invert[c.department_id])
    end
    column :name
    column :email
    column :phone
    column :message

    actions
  end

  show do
    attributes_table do
      row :id
      row :department_id do
        t(Contact::DEPARTMENT_ID.invert[feedback.department_id])
      end
      row :name
      row :email
      row :phone
      row :message
    end
    active_admin_comments
  end
end
