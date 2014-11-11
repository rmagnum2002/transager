require 'rails_helper'

RSpec.describe PostsController, :type => :controller do

  describe "GET carrier" do
    it "returns http success" do
      get :carrier
      expect(response).to be_success
    end
  end

end
