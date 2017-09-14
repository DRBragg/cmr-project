class Api::V1::DownvotesController < ApplicationController

  def create
    data = JSON.parse(request.body.read)
    downvote = Downvote.new
    downvote.assign_attributes(review: Review.find(data["downvote"]["review_id"]), user: User.find(data["downvote"]["user_id"]))
    if downvote.save
      upvoted = Upvote.find_by(user: downvote.user, review: downvote.review)
      if upvoted
        change_score = downvote.review.score -= 2
        downvote.review.update(score: change_score)
        upvoted.destroy
      elsif !upvoted
        new_score = downvote.review.score -= 1
        downvote.review.update(score: new_score)
      end
      response = { score: downvote.review.score }
      render json: response
    else
      render status: :unprocessable_entity
    end
  end
end
