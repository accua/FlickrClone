class TagsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @picture = Picture.find(params[:picture_id])
    @tag = Tag.new
    @users = User.all
  end

  def create
    @picture = Picture.find(params[:picture_id])
    @tag = @picture.tags.new
    if @picture.save
      redirect_to :back
    else
      render :new
    end
  end

private
  def tag_params
    params.require(:tag).permit(:title, :user_id)
  end
end
