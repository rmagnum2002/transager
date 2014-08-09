class AddLinkNameToPages < ActiveRecord::Migration
  def change
    add_column :pages, :link_name, :string
  end
end
