class AddEnableChatToAppSettings < ActiveRecord::Migration
  def change
    add_column :app_settings, :enable_chat, :boolean, default: :true
  end
end
