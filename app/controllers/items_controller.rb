class ItemsController < ApplicationController
  def create
    current_user
    item = current_user.items.new(item_params)

    if item.save
      flash[:notice] = "Item was added to your list."
    else
      flash[:alert] = "There was an error saving the item, please try again."
    end

    redirect_to root_path
  end

  def destroy
    @user = current_user
    item = @user.items.find(params[:id])

    if item.destroy
      flash[:notice] = "Item is completed and remove from list. GOOD JOB!"
      redirect_to root_path
    else
      flash[:alert] = "Item Couldn't be completed, please try again!"
      redirect_to root_path
    end
  end

  def item_params
    params.require(:item).permit(:name)
  end
end