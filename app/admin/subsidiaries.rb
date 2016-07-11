ActiveAdmin.register Subsidiary do
   # actions :index, :show, :destroy

  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :name_en, :name_ro, :name_ru, :address_en,
                :address_ro, :address_ru, :gps, :external_id,
                :position, :avatar, on: :subsidiary
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
    column :name_en
    # column :name_ro
    # column :name_ru
    column :address_en
    # column :address_ro
    # column :address_ru
    column :gps
    column :external_id
    column :position
    actions
  end

  form do |f|
    f.inputs "Project Details" do
      f.input :name_en
      f.input :name_ro
      f.input :name_ru
      f.input :address_en
      f.input :address_ro
      f.input :address_ru
      f.input :gps
      f.input :external_id
      f.input :position
      f.input :avatar, as: :file, hint: f.template.image_tag(f.object.avatar.url(:medium))
      # Will preview the image when the object is edited
    end
    f.actions
  end

  # show do
  #   attributes_table do
  #     row :id
  #     row :department_id do
  #       t(Contact::DEPARTMENT_ID.invert[feedback.department_id])
  #     end
  #     row :name
  #     row :email
  #     row :phone
  #     row :message
  #   end
  #   active_admin_comments
  # end
end
