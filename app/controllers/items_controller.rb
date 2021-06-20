class ItemsController < ApplicationController

  before_action(:set_item, except: [:index, :new, :create])
  # before_action(:set_item, only: [:show, :edit, :update, :destroy]) # You can use except(above) or only 
  # skip_before_action :set_item, only: [:index, :new, :create]
  before_action(:require_login) # are only invoked before our action/ restful routing actions so not the private methods
  

    layout "application"

  def index
    # render(:index) # Not neccesary to write this code because rails will look for a floder called items 
                     # since we are in the ItemsController and look for look for a file called about. You 
                     # technically dont even need the about method becuase rails will figure it out from your get request.
    if params[:user_id]
      user = User.find_by(id: params[:user_id])
      @items = user.items
    else                 
      @items = Item.all       
    end           
  end

  def show 
     # set_item #replaced with before action
    #@measurements = @item.measurements # replaced with local views/measurements/index.html.erb
  end

  #get '/items'
  def new # Seeing the form 
    @item = Item.new # Using new instead of create becuase we dont want to save the object here, we want to make a placeholder so that form_for in new.html.erb knows how to set up that form.
    @item.measurements.build(user: current_user) # Builds the quantity and unit inputs in views/items/new  
    @measurements = @item.measurements.select{|m| m.user_id == current_user.id}
  end

  #post '/items'
  def create # Creating the post
    @item = Item.new(item_params) # Item.new does not hit the database until @item.save passes if it is unique and present.
    @item.measurements.each {|m| m.user = current_user} #Before we save this item we need to iterate through all the measurements and give each mesasurement a user attribute of the current user
    if @item.save
      redirect_to item_path(@item)
    else
      # redirect_to new_item_path  # This take us back to the new controller action (wipes away what we wrote in the text_field)
      @errors = @item.errors.full_messages 
      render :new # This renders back a view form (requires an instance of the object therefore @item)
    end

    # item = Item.create(item_params) # Item.create hits the database and is rolledback if not valid?
    # if item.valid?
      # redirect_to item_path(item)
    # else
      # redirect_to new_item_path
    # end
  end

  def edit
    # set_item #replaced with before action
    @measurements = @item.measurements.where(user_id: current_user.id)
  end

  def update
     # set_item #replaced with before action
    if @item.update(item_params)
      redirect_to item_path(@item) 
    else
      # @errors = @item.errors.full_messages # we now send @item.errors.full_messages _errors partial in the item/new.erb view
      @measurements = @item.measurements.select{|m| m.user_id == current_user.id}
      render :edit
    end
  end

  def destroy
    # set_item #replaced with before action 
    @item.delete
    redirect_to items_path
  end

  private

    def item_params # Instance method
      params.require(:item).permit(:name, measurements_attributes: [:unit, :quantity, :user_id, :id])
    end

    def set_item
      @item = Item.find_by(id: params[:id])
    end

end 