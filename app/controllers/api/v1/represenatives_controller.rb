class Api::V1::RepresentativesController < ApplicationController

  def index
    render json: Representative.all
  end

  def show
    render json: Representative.find(params[:id])
    render json: Review.find(params[:representative_id])
    render json: Comment.find(params[:review_id])
  end

  def create
    render json: Representative.create(params[:representative])
  end

  def update
    render json: Representative.update(params[:id], params[:representatives])
  end

  def destroy
    render json: Representative.destroy(params[:id])
  end

end
