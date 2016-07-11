class AddAttachmentAvatarToSubsidiaries < ActiveRecord::Migration
  def self.up
    change_table :subsidiaries do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :subsidiaries, :avatar
  end
end
