class Api::V1::ReviewsController < ApplicationController
  def index
    reviews = Review.where(representative_id: params[:representative_id])
    render json: reviews
  end

  def create
    data = JSON.parse(request.body.read)
    newReview = Review.new
    newReview.assign_attributes(headline: data["headline"], body: data["body"], rating: data["rating"], representative: Representative.find(data["representative_id"]), user: User.find(data["user_id"]))
    if newReview.save
      render json: newReview
    else
      render status: :unprocessable_entity
    end
  end
end
