class RepresentativesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @representatives = Representative.all
  end

  def show
    @user = current_user
    @representative = Representative.find(params[:id])
    @reviews = @representative.reviews
    @comments = {}
    @reviews.each do |review|
      @comments[review.id] = review.comments
    end
  end

  def new
    @user = current_user
    @representative = Representative.new
  end

  def create
    @user = current_user
    @representative = Representative.create(representative_params)
    @representative.user = @user

    if @representative.save
      redirect_to @representative, notice: "Representative added successfully"
    else
      flash[:alert] = @representative.errors.full_messages.join(', ')
      render :new
    end
  end

  private

  def representative_params
    params.require(:representative).permit(:first_name, :last_name, :office, :email, :party, :bio, :elected, :phone_number, :picture_url)
  end
end
