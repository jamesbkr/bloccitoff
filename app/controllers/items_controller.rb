class ItemsController < ApplicationController

  def create
    @item = current_user.items.build(item_params)
    
      if @item.save
       flash[:notice] = "Item was saved."
     else
       flash[:error] = "There was an error saving the post. Please try again."
     end
       redirect_to current_user
  end
  def destroy
    @item = Item.find(params[:id])
   
    if @item.destroy
      flash[:notice] = "item was removed from your list"
    else 
      flash[:error] = "there was an error deleting your item"
    end

    respond_to do |format|
    format.js
    format.html
    
    end

  end
  
  private
  
  def item_params
    params.require(:item).permit(:name)
  end
end
