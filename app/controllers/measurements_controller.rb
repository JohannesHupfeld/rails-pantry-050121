class MeasurementsController < ApplicationController

    layout "application"

  def index
    @measurements = Measurement.all
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
