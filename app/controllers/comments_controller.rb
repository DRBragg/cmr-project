class CommentsController < ApplicationController
  def new

    @review = Review.find(params[:review_id])
    @comment = Comment.new
  end

  def create
    @review = Review.find(params[:review_id])
    @representative = Representative.find_by(params[:representative_id])
    @comment = Comment.create(comment_params)
    @comment.review = @review
    if @comment.save
      redirect_to @representative, notice: "Comment added successfully"
    else
      flash[:alert] = @comment.errors.full_messages.join(' , ')
      render :new
    end
  end

  private

   def comment_params
     params.require(:comment).permit(:body)
   end
end
