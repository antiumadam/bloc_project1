class RingsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @rings = Ring.all
  end

  def new
    @ring = Ring.new
  end

  def show
    @ring = Ring.find(params[:id])
  end

  def create
    @ring = Ring.new(params[:ring])

    if @ring.save
      redirect_to(@ring, :notice => 'Ring created!')
    else
      render :action => "new"
    end
  end

  def edit
    authorize! :edit, @ring, :notice => 'You are not authorized to perform this action'
    @ring = Ring.find(params[:id])  
  end

  def update
    @ring = Ring.find(params[:id])

    if @ring.update_attributes(params[:ring])
      redirect_to @ring, :notice => 'Ring updated successfully.'
    else
      render "edit" 
    end
  end

  def destroy
    @ring = Ring.find(params[:id])
    @ring.destroy

     respond_to do |format|
       format.html { redirect_to rings_url }
     end
  end
end
