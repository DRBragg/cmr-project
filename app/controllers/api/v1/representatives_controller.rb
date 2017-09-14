class Api::V1::RepresentativesController < ApplicationController
  def index
    render json: Representative.all
  end

  def show
    render json: Representative.find(params[:id])
  end

end
