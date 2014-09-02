class ContactsController < ApplicationController
  def index
    @feedback = Feedback.new
  end
end
