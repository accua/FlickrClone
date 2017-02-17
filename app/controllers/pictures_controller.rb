class PicturesController < ApplicationController
  before_action :authenticate_user!

  def show
    @comments = Comment.where(picture_id: params[:id]).order('created_at DESC')
    @picture = Picture.find(params[:id])
  end

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
    redirect_to :back
  end

  private
    def picture_params
      params.require(:picture).permit(:title, :description, :image_url, :owner_id, :local_pic)
    end
end
