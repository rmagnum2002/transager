class AddIncludeSuppliersInPagesToAppSettings < ActiveRecord::Migration
  def change
    add_column :app_settings, :include_suppliers, :boolean, default: true
  end
end
