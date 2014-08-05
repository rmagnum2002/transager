class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :contact_type
      t.integer :department_id
      t.string :details

      t.timestamps
    end
  end
end
