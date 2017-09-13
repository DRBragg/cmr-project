class Api::V1::ReviewsController < ApplicationController
  def index
    reviews = Review.where(representative_id: params[:representative_id])
    render json: reviews
  end

  def show
    review = Review.find(params[:id])
    render json: review
  end

  def create
    @review = Review.new
    @review.assign_attributes(@json['review'])
    if @review.save
      render json: @review
    else
      render nothing: true, status: :bad_request
    end
  end
end
