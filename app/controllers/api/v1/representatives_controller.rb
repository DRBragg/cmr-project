class Api::V1::RepresentativesController < ApplicationController
  def index
    render json: Representative.all
  end

  def show
    # representative = Representative.find(params[:id])
    render json: Representative.find(params[:id])
    # reviews = representative.reviews
    # render json: reviews
  end

end
