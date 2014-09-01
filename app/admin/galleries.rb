ActiveAdmin.register Gallery do


  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :name, :images
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

  # index do
  #   column :id
  #   actions
  # end

  show do |page|
    attributes_table do
      row :id
      row :name
      row :created_at
      row :updated_at
    end

    panel 'Images' do
      render 'images', gallery: gallery
    end
    active_admin_comments
  end

  form do |f|
    render 'form'
  end

  controller do
    before_action :set_gallery, only: [:show, :edit, :update, :destroy]

    def create
      @gallery = Gallery.new(gallery_params)

      respond_to do |format|
        if @gallery.save

          if params[:images]
            #===== The magic is here ;)
            params[:images].each { |image|
              @gallery.gallery_items.create(image: image)
            }
          end

          format.html { redirect_to [:admin, @gallery], notice: 'Gallery was successfully created.' }
          format.json { render json: @gallery, status: :created, location: @gallery }
        else
          format.html { render action: "new" }
          format.json { render json: @gallery.errors, status: :unprocessable_entity }
        end
      end
    end

  private
    def set_gallery
      @gallery = Gallery.find(params[:id])
    end

    def gallery_params
      params.require(:gallery).permit!
    end
  end

end
