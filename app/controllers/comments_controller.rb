class CommentsController < ApplicationController
  # before_action :authenticate_user!

  def index
    @comments = Comment.all

    respond_to do |format|
      format.json { render json: @comments }
    end
  end

  def new
    @user = current_user
    @review = Review.find(params[:review_id])
    @comment = Comment.new
  end

  def create
    @user = current_user
    @review = Review.find(params[:review_id])
    if params[:representative_id] { @representative = Representative.find_by(params[:representative_id]) }
    @comment = Comment.create(comment_params)
    @comment.review = @review
    @comment.user = @user

    respond_to do |format|
      if @comment.save
        # CommentMailer.new_comment(@comment).deliver_now
        format.json { render json: @comment }
        format.html { redirect_to @representative, notice: "Comment added successfully" }
      else
        format.json { render json: "Error Saving Comment"}
        flash[:alert] = @comment.errors.full_messages.join(' , ')
        format.html { render :new }
      end
    end
  end


  # def create
  #   @user = current_user
  #   @review = Review.find(params[:review_id])
  #   @representative = Representative.find_by(params[:representative_id])
  #   @comment = Comment.create(comment_params)
  #   @comment.review = @review
  #   @comment.user = @user
  #
  #   if @comment.save
  #     redirect_to @representative, notice: "Comment added successfully"
  #   else
  #     flash[:alert] = @comment.errors.full_messages.join(' , ')
  #     render :new
  #   end
  # end

  def edit
    @representative = Representative.find(params[:representative_id])
    @review = Review.find(params[:review_id])
    @comment = Comment.find(params[:id])
    @user = current_user
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
