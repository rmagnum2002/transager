class ContactsController < ApplicationController
  def index
    @feedback = Feedback.new
    @offices = Subsidiary.order('id asc')
  end
end
