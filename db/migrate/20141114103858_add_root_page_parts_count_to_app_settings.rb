class AddRootPagePartsCountToAppSettings < ActiveRecord::Migration
  def change
    add_column :app_settings, :root_page_parts_count, :integer, default: 4
  end
end
