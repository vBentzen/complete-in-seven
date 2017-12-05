class UsersController < ApplicationController
  def show
    @user = User.find(current_user)
    @items = current_user.items
  end
end
