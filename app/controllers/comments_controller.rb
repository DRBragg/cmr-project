class CommentsController < ApplicationController
  before_action :authenticate_user!
  def new
    @user = current_user
    @review = Review.find(params[:review_id])
    @comment = Comment.new
  end

  def create
    @user = current_user
    @review = Review.find(params[:review_id])
    @representative = Representative.find_by(params[:representative_id])
    @comment = Comment.create(comment_params)
    @comment.review = @review
    @comment.user = @user

    if @comment.save
      redirect_to @representative, notice: "Comment added successfully"
    else
      flash[:alert] = @comment.errors.full_messages.join(' , ')
      render :new
    end
  end

  def edit
    @representative = Representative.find(params[:representative_id])
    @review = Review.find(params[:review_id])
    @comment = Comment.find(params[:id])
    @user = current_user
    unless @user == @comment.user
      flash[:alert] =  "You are not the comments owner"
      redirect_back(fallback_location: root_path)
    end
  end

  def update
    @user = current_user
    @review = Review.find(params[:review_id])
    @representative = Representative.find(params[:representative_id])
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      redirect_to @representative, notice: "Comment updated successfully"
    else
      flash[:alert] = @comment.errors.full_messages.join(' , ')
      render :new
    end
  end

  def destroy
    @user = current_user
    @representative = Representative.find(params[:representative_id])
    @review = Review.find(params[:review_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @representative
  end

  private

   def comment_params
     params.require(:comment).permit(:body)
   end
end
