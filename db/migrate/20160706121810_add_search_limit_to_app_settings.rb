class AddSearchLimitToAppSettings < ActiveRecord::Migration
  def change
    add_column :app_settings, :search_limit, :integer, default: 10
  end
end
