class MeasurementsController < ApplicationController

    layout "application"

  def index
    if params[:quantity] # Did the user use the search bar
      @measurements = Measurement.quantity_search(params[:quantity])
    else
      @measurements = Measurement.all
    end
  end
  
  def new # New instantiates an object to work within the form
    @measurement = Measurement.new
    @items = Item.all
  end

  def create # Create actually saves it to the database
    @measurement = Measurement.create(measurement_params)
    redirect_to items_path
  end

  private

    def measurement_params
      params.require(:measurement).permit(:quantity, :unit, :item_id)
    end
end
