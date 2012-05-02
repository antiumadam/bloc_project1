class PostsController < ApplicationController
  def create
     @ring = Ring.find(params[:ring_id])
     @post = @ring.posts.create(params[:post])
     redirect_to ring_path(@ring)
   end
end
