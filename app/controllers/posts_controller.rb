class PostsController < ApplicationController
  before_filter :authenticate_user!
  
  def create
     @ring = Ring.find(params[:ring_id])
     @post = @ring.posts.create(params[:post].merge(:user_id => current_user.id))
     redirect_to ring_path(@ring)
  end
  
end
