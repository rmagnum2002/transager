class AddKeywordsAndDescriptionToAppSettings < ActiveRecord::Migration
  def change
    add_column :app_settings, :keywords, :text
    add_column :app_settings, :description, :text
  end
end
