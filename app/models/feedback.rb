class Feedback < ActiveRecord::Base
  validates :name, :email, :message, :department_id, presence: :true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create }
  validates_length_of :message, :in => 50..800, :allow_nil => true

  after_create :send_email

  def send_email
    AppMailer.feedback(self).deliver!
  end
end
