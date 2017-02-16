class TagsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @tags = Tag.where(user_id: current_user.id)
    @pictures = []
    @tags.each do |tag|
      picture = tag.picture
      @pictures.push(picture)
    end
  end

  def new
    @picture = Picture.find(params[:picture_id])
    @tag = Tag.new
    @users = User.all
    @user_ids = []
    @users.each do |user|
      temp = []
      temp.push(user.email)
      temp.push(user.id)
      @user_ids.push(temp)
    end
  end

  def create
    # if tag_params[:user_id] == nil
    #   puts "!!!!!!!!!!!!!!!!!!!!!!!", tag_params[:user_id]
    #   tag_params.key(:user_id)
    #   tag_params[:user_id] = 1
    # end
    @users = User.all
    @picture = Picture.find(params[:picture_id])
    @tag = @picture.tags.new(tag_params)
    if @picture.save
      redirect_to picture_path(@picture)
    else
      flash[:alert] = "Tag was not added, Please try again"
      render :new
    end
  end

private
  def tag_params
    params.require(:tag).permit(:title, :user_id)
  end
end
