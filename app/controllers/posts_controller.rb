class PostsController < ApplicationController
  def career
    @post = Post.carrier.find(params[:id])
  end

  def careers
    @posts = Post.carrier.all
  end
end
