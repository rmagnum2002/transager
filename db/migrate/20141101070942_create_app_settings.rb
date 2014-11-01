class CreateAppSettings < ActiveRecord::Migration
  def change
    create_table :app_settings do |t|
      t.boolean :slider_option, default: :false
      t.boolean :map_option, default: :false

      t.timestamps
    end
  end
end
