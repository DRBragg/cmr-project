class DownvotesController < ApplicationController
  def create
    unless user_signed_in?
      flash[:danger] = "Please sign in to downvote"
      redirect_back(fallback_location: root_path)
    else
      @user = User.find(current_user.id)
      @review = Review.find(params[:review_id])
      @downvote = Downvote.new(user: @user, review: @review)
      @representative = Representative.find(params[:representative_id])
      if @downvote.save
        flash[:success] = "Downvoted!"
        redirect_to @representative
      else
        flash[:danger] = "You've already downvoted"
        redirect_back(fallback_location: root_path)
      end
    end
  end

  def destroy

  end
end
