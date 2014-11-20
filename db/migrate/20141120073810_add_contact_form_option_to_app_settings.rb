class AddContactFormOptionToAppSettings < ActiveRecord::Migration
  def change
    add_column :app_settings, :contact_form, :boolean, default: :false
  end
end
