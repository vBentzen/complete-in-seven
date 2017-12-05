class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new
    @item.name = params[:item][:name]

    if @item.save
      flash[:notice] = "Item was added to your list."
    else
      flash[:alert] = "There was an error saving the item, please try again."
    end

    redirect_to root_path
  end
end