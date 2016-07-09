class Subsidiary < ActiveRecord::Base
  has_many :contacts

  def lat
    gps.split(', ')[0]
  end

  def lng
    gps.split(', ')[1]
  end
end
