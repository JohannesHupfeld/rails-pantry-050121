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
    @item = Item.new (item_params) # Item.new does not hit the database until @item.save passes if it is unique and present.
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
    @item = Item.find_by(id: params[:id])
  end

  def update
    @item = Item.find_by(id: params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item) 
    else
      @errors = @item.errors.full_messages 
      render :edit
    end
  end

  def destroy
    item = Item.find_by(id: params[:id]) 
    item.delete
    redirect_to items_path
  end

  private

    def item_params # Instance method
      params.require(:item).permit(:name)
    end

end 