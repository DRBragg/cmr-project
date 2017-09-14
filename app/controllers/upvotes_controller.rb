class UpvotesController < ApplicationController
  def create
    unless user_signed_in?
      flash[:danger] = "Please sign in to upvote"
      redirect_back(fallback_location: root_path)
    else
      @user = User.find(current_user.id)
      @review = Review.find(params[:review_id])
      @upvote = Upvote.new(user: @user, review: @review)
      if @upvote.save
        @downvoted = Downvote.find_by(user: @user, review: @review)
        if !@downvoted.nil?
          @review.score += 2
          @downvoted.destroy
        end
        @review.score += 1
        render json: upvote
        flash[:success] = "Upvoted!"
      else
        flash[:danger] = "You've already upvoted"
      end
    end
  end
end
