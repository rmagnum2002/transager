class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.text :text_1
      t.text :text_2
      t.text :text_3
      t.string :locale
      t.integer :page_type

      t.timestamps
    end
  end
end
