 class UsersController < ApplicationController
   before_action :authenticate_user, only: [:edit, :update]
   before_action :check_authorization, only: [:edit, :update]
   before_action :set_user
   def show
     @user = User.find(params[:id])
   end

   def edit
   end

   def update
   end

   private

   def check_authorization
     unless current_user.id == params[:id]
       redirect_to root_path
     end
   end

   def set_user
     @user = User.find(params[:id])
   end
 end
