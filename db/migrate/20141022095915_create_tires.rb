class CreateTires < ActiveRecord::Migration
  def change
    create_table :tires do |t|
      t.string :seller_id
      t.string :manufacturer_id
      t.string :name
      t.decimal :price, :precision => 8, :scale => 2
      t.boolean :winter, default: :false
      t.boolean :truck, default: :false
      t.string :brand

      t.timestamps
    end
  end
end
