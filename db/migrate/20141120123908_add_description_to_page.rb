class AddDescriptionToPage < ActiveRecord::Migration
  def change
    add_column :pages, :description, :string, default: ''
  end
end
