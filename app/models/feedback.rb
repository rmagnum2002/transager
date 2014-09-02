class Feedback < ActiveRecord::Base
  validates :name, :email, :message, presence: :true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create }
end
