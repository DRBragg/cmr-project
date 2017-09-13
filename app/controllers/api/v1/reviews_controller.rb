class Api::V1::ReviewsController < ApplicationController
  def index
    reviews = Review.where(representative_id: params[:representative_id])
    render json: reviews
  end

  def create
    data = JSON.parse(request.body.read)
    review = Review.new
    review.assign_attributes(headline: data["headline"], body: data["body"], rating: data["rating"], representative: Representative.find(data["representative_id"]), user: User.find(data["user_id"]))
    if review.save
      render json: review
    else
      render status: :unprocessable_entity
    end
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
