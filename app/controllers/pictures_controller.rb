class PicturesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
   if @picture.save
     flash[:notice] = "Picture added"
     redirect_to pictures_path
   else
     flash[:alert] = "Please try again"
     redirect_to :back
   end
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])
    @picture.update(picture_params)
    if @picture.save
      redirect_to picture_path(@picture)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(current_user.id)
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to user_path(@user)
  end

  private
    def picture_params
      params.require(:picture).permit(:title, :description, :image_url, :owner_id, :local_pic)
    end
end
