class Subsidiary < ActiveRecord::Base
  has_many :contacts
  has_attached_file :avatar
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png"]

  def lat
    gps.split(', ')[0]
  end

  def lng
    gps.split(', ')[1]
  end
end
