class ItemsController < ApplicationController
  def index
    # render(:index) # Not neccesary to write this code because rails will look for a floder called items 
                     # since we are in the ItemsController and look for look for a file called about. You 
                     # technically dont even need the about method becuase rails will figure it out from your get request.
    @items = Item.all                  
  end

  def show 
    @item = Item.find_by(id: params[:id])
  end

  #get '/items'
  def new # Seeing the form 
    @item = Item.new # using new instead of create becuase we dont want to save the object here, we want to 
                     # make a placeholder so that form_for in new.html.erb knows how to set up that form.
  end

  #post '/items'
  def create # Creating the post
    item = Item.create(params.require(:item).permit(:name))
    redirect_to item_path(item)
  end

  def edit
  end

  def update
  end

end 