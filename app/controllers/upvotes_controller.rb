class UpvotesController < ApplicationController
  def create
    unless user_signed_in?
      flash[:danger] = "Please sign in to upvote"
      redirect_back(fallback_location: root_path)
    else
      @user = User.find(current_user.id)
      @review = Review.find(params[:review_id])
      @upvote = Upvote.new(user: @user, review: @review)
      @representative = Representative.find(params[:representative_id])
      if @upvote.save
        flash[:success] = "Upvoted!"
        redirect_to @representative
      else
        flash[:danger] = "You've already upvoted"
        redirect_back(fallback_location: root_path)
      end
    end
  end

  def destroy

  end
end
