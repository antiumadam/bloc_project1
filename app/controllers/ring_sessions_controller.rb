class RingSessionsController < ApplicationController

  def create
    if @insiderings = Ring.inside(params[:latitude], params[:longitude])
      session[:ring_session] = @insiderings.map(&:id).join(",")
      redirect_to rings_path

    end
  end
  
end
