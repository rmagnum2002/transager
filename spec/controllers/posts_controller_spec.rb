require 'rails_helper'

RSpec.describe PostsController, :type => :controller do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :careers
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :careers
      expect(response).to render_template("careers")
    end

    it "loads all of the posts into @posts" do
      post1, post2 = Post.create!(post_type: 1), Post.create!(post_type: 1)
      get :careers

      expect(assigns(:posts)).to match_array([post1, post2])
    end
  end
end
