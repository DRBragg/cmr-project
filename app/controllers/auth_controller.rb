class AuthController < ApplicationController
  def is_signed_in?
    user = current_user.to_json
    if user_signed_in?
      render json: user
    else
      render status: :unprocessable_entity
    end

  end
end
