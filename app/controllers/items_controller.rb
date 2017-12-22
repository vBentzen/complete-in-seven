class ItemsController < ApplicationController
  def create
    @item = current_user.items.new(item_params)
    @item.completed = false

    if @item.save
      flash[:notice] = "Item was added to your list."
      redirect_to root_path
    else
      flash[:alert] = "There was an error saving the item, please try again."
      @items = current_user.items.reject {|item| item.created_at.blank?}
      render "users/show"
    end
  end

  def destroy
    item = current_user.items.find(params[:id])

    if item.destroy
      flash[:notice] = "Item is completed and remove from list. GOOD JOB!"
      redirect_to root_path
    else
      flash[:alert] = "Item Couldn't be completed, please try again!"
      redirect_to root_path
    end
  end

  def update
    @item = current_user.items.find(params[:id])
    @item.completed = true

    if @item.save
      flash[:notice] = "Item is done. gj mate."
      redirect_to root_path
    else
      flash[:alert] = "try again."
      redirect_to root_path
    end
  end

  def item_params
    params.require(:item).permit(:name, :completed)
  end
end