class AddAttachmentHeaderImageToPages < ActiveRecord::Migration
  def self.up
    change_table :pages do |t|
      t.attachment :header_image
    end
  end

  def self.down
    remove_attachment :pages, :header_image
  end
end
