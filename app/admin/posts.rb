ActiveAdmin.register Post do
  permit_params :title, :content, :post_type, :name, on: :part


  index do
    selectable_column
    column :id
    column :post_type do |p|
      t(Post::POST_TYPE.invert[p.post_type])
    end
    column :created_at
    column :updated_at

    actions
  end


  form do |f|
    f.inputs 'Part' do
      f.input :title
      f.input :post_type, as: :select, collection: Post::POST_TYPE.map{|value, key| [t(value), key] }
      f.input :content, :as => :ckeditor
    end
    f.actions
  end

  show do |page|
    attributes_table do
      row :title
      row :post_type do
        t(Post::POST_TYPE.invert[page.post_type])
      end
      row :content do
        raw(page.content)
      end
    end
    active_admin_comments
  end


  # filter :post_type, as: :select, collection: Post::POST_TYPE.to_a
  filter :title
  # filter :content
end
