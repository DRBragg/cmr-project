class Api::V1::ReviewsController < ApplicationController

    def index
    end

    def create
      render json: Review.create(params[:review])
    end

    def update
        render json: Review.update(params[:id], params[:reviews])
    end

    def detroy
      render json: Review.destroy(params[:id])
    end


end
