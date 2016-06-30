class AddInternalIdToParts < ActiveRecord::Migration
  def change
    add_column :parts, :internal_id, :string
    add_index :parts, :internal_id
  end
end
