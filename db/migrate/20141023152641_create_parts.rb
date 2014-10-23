class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.string :name
      t.string :manufacturer_id
      t.string :seller_id
      t.decimal :price, :precision => 8, :scale => 2
      t.boolean :winter, default: :false
      t.boolean :truck, default: :false
      t.string :brand
      t.integer :category_id

      t.timestamps
    end
  end
end
