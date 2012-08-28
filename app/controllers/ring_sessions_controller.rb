class RingSessionsController < ApplicationController

  def create
    if @insiderings = Ring.inside(params[:latitude], params[:longitude])
      session[:ring_session] = @insiderings.map(&:id).join(",")
      redirect_to rings_path 
    else
      redirect_to root_path, :notice => "It appears we were unable to determine your location.
      Please make sure you are allowing your browser access to your location."
    end
  end
  
end
