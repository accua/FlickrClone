class UsersController < ApplicationController

  def show
    @pictures = Picture.where(owner_id: current_user.id)
    @tags = Tag.where(user_id: current_user.id)
  end
end
