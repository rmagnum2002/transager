class AddOrderToParts < ActiveRecord::Migration
  def change
    add_column :parts, :order, :boolean, default: false
  end
end
