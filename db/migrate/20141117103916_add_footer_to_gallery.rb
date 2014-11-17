class AddFooterToGallery < ActiveRecord::Migration
  def change
    add_column :galleries, :footer, :boolean
  end
end
