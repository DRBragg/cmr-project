class Api::V1::CommentsController < ApplicationController
  def index
    comments = Comment.where(review_id: params[:review_id])
    render json: comments
  end

  def create
    @comment = Comment.new
    @comment.assign_attributes(@json['comment'])
    if @comment.save
      render json: @comment
    else
      render nothing: true, status: :bad_request
    end
  end
end
