class Api::V1::ReviewsController < ApplicationController
  def index
    reviews = Review.where(representative_id: params[:representative_id])
    render json: reviews
  end

  def show
    review = Review.find(params[:id])
    render json: review
  end
end
