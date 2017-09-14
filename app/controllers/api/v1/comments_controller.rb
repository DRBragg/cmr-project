class Api::V1::CommentsController < ApplicationController
  def index
    comments = Comment.where(review_id: params[:review_id])
    render json: comments
  end

  def create
    data = JSON.parse(request.body.read)
    comment = Comment.new
    comment.assign_attributes(body: data["comment"]["body"], review: Review.find(data["comment"]["review_id"]), user: User.find(data["comment"]["user_id"]))
    if comment.save
      render json: comment
    else
      render status: :unprocessable_entity
    end
  end
end
