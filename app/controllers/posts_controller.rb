class PostsController < ApplicationController
  def career
    @post = Post.job_offer.find(params[:id])
  end

  def careers
    @posts = Post.job_offer.all
  end
end
