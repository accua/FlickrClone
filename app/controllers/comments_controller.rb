class CommentsController < ApplicationController
before_action :authenticate_user!

  def new
    @picture = Picture.find(params[:picture_id])
    @comment = Comment.new
    @users = User.all
  end

  def create
    @users = User.all
    @picture = Picture.find(params[:picture_id])
    @comment = @picture.comments.new(comment_params)
    if @picture.save
      redirect_to picture_path(@picture)
    else
      flash[:alert] = "Comment was not added, Please try again"
      render :new
    end
  end

  def upvote
    @comment = Comment.find(params[:id])
    @comment.upvote_by current_user
    redirect_to :back
  end

  def downvote
    @comment = Comment.find(params[:id])
    @comment.downvote_by current_user
    redirect_to :back
  end

  def edit
    @picture = Picture.find(params[:picture_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:picture_id])
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    if @comment.save
      redirect_to picture_path(@picture)
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.delete
    redirect_to :back
  end

private
  def comment_params
    params.require(:comment).permit(:content, :user_id)
  end
end
