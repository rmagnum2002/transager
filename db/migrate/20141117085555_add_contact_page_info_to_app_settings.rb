class AddContactPageInfoToAppSettings < ActiveRecord::Migration
  def change
    add_column :app_settings, :phone, :string
    add_column :app_settings, :email, :string
  end
end
