class Api::V1::CommentsController < ApplicationController


    def create
      render json: Comment.create(params[:comment])
    end

    def update
        render json: Comment.update(params[:id], params[:comments])
    end

    def detroy
      render json: Comment.destroy(params[:id])
    end
end
