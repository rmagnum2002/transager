class AddShowContactsOptionToPages < ActiveRecord::Migration
  def change
    add_column :pages, :show_contacts, :boolean, default: :true
  end
end
