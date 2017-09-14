class Api::V1::UpvotesController < ApplicationController

  def create
    data = JSON.parse(request.body.read)
    upvote = Upvote.new
    upvote.assign_attributes(review: Review.find(data["upvote"]["review_id"]), user: User.find(data["upvote"]["user_id"]))
    if upvote.save
      downvoted = Downvote.find_by(user: upvote.user, review: upvote.review)
      if downvoted
        change_score = upvote.review.score += 2
        upvote.review.update(score: change_score)
        downvoted.destroy
      elsif !downvoted
        new_score = upvote.review.score += 1
        upvote.review.update(score: new_score)
      end
      response = { score: upvote.review.score }
      render json: response
    else
      render status: :unprocessable_entity
    end
  end
end
