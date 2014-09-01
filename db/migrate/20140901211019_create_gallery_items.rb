class CreateGalleryItems < ActiveRecord::Migration
  def change
    create_table :gallery_items do |t|
      t.belongs_to :gallery, index: true
      t.string :title

      t.timestamps
    end
  end
end
