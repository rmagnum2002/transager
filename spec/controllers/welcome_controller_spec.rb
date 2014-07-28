require 'rails_helper'

RSpec.describe WelcomeController, :type => :controller do

  describe "GET shop" do
    it "returns http success" do
      get :shop
      expect(response).to be_success
    end
  end

end
