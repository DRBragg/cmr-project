class Api::V1::CommentsController < ApplicationController
  def index
    comments = Comment.where(review_id: params[:review_id])
    render json: comments
  end
end
