class RingsController < ApplicationController
  def index
    @rings = Ring.all

      respond_to do |format|
        format.html #index.html.erb
        format.json {render :json => @rings}
      end
  end

  def new
    @ring = Ring.new
  end

  def show
    @ring = Ring.find(params[:id])

      respond_to do |format|
        format.html  # show.html.erb
        format.json  { render :json => @ring }
      end
  end

  def create
    @ring = Ring.new(params[:ring])

      respond_to do |format|
        if @ring.save
          format.html  { redirect_to(@ring,
                        :notice => 'Ring created!') }
          format.json  { render :json => @ring,
                        :status => :created, :location => @ring }
        else
          format.html  { render :action => "new" }
          format.json  { render :json => @ring.errors,
                        :status => :unprocessable_entity }
        end
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
          format.json  { head :no_content }
        else
          format.html  { render :action => "edit" }
          format.json  { render :json => @ring.errors,
                        :status => :unprocessable_entity }
        end
      end
  end

  def destroy
    @ring = Ring.find(params[:id])
     @ring.destroy

     respond_to do |format|
       format.html { redirect_to rings_url }
       format.json { head :no_content }
     end
  end
end
