class MeasurementsController < ApplicationController
  before_action(:require_login)
    layout "application"

  def index
    if params[:quantity] # Did the user use the search bar
      @measurements = Measurement.quantity_search(params[:quantity])
    else
      @measurements = Measurement.all
    end
  end
  
  def new # New instantiates an object to work within the form
    if params[:item_id]
      @item = Item.find_by(id: params[:item_id])
      @measurement = @item.measurements.build
      @items = Item.all 
    else
      @measurement = Measurement.new
      @items = Item.all
    end
  end

  def create # Create actually saves it to the database
    @measurement = Measurement.create(measurement_params)
    @measurement.user = current_user
    if params[:item_id]
      @measurement.item_id = params[:item_id]  # this is if we come in through the nested route item/1/measurement/new
    end
    if @measurement.save
      redirect_to items_path
    else
      @errors = @measurement.errors.full_messages 
      @items = Item.all
      render :new
    end
  end

  private

    def measurement_params
      params.require(:measurement).permit(:quantity, :unit, :item_id)
    end
end
