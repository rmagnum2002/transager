class AddTruckIdToParts < ActiveRecord::Migration
  def change
    add_column :parts, :truck_id, :integer
  end
end
