class RingsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @rings = Ring.all

      respond_to do |format|
        format.html
      end
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
    @ring = Ring.find(params[:id])
  end

  def update
    @ring = Ring.find(params[:id])

      respond_to do |format|
        if @ring.update_attributes(params[:ring])
          format.html  { redirect_to(@ring,
                        :notice => 'Ring name successfully changed.') }
        else
          format.html  { render :action => "edit" }
        end
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
