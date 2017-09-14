class DownvotesController < ApplicationController
  def create
    unless user_signed_in?
      flash[:danger] = "Please sign in to downvote"
      redirect_back(fallback_location: root_path)
    else
      @user = User.find(current_user.id)
      @review = Review.find(params[:review_id])
      @downvote = Downvote.new(user: @user, review: @review)
      if @downvote.save
        @upvoted = Upvote.find_by(user: @user, review: @review)
        if !@upvoted.nil?
          @review.score -= 2
          @upvoted.destroy
        end
        @review.score -= 1
        render json: downvote
        flash[:success] = "Downvoted!"
      else
        flash[:danger] = "You've already downvoted"
      end
    end
  end
end
