class ItemsController < ApplicationController


  def create
    @user = current_user
    item = @user.items.new(item_params)

    if item.save
      flash[:notice] = "Item was added to your list."
    else
      flash[:alert] = "There was an error saving the item, please try again."
    end

    redirect_to root_path
  end

  def item_params
    params.require(:item).permit(:name)
  end
end