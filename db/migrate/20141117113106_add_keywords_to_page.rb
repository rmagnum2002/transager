class AddKeywordsToPage < ActiveRecord::Migration
  def change
    add_column :pages, :keywords, :text, default: ''
  end
end
