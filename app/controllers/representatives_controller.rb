class RepresentativesController < ApplicationController
  def index
    @representatives = Representative.all
  end

  def show
    @representative = Representative.find(params[:id])
    @reviews = @representative.reviews
    @comments = {}
    @reviews.each do |review|
      @comments[review.id] = review.comments
    end
  end

  def new
    @representative = Representative.new
  end

  def create
    @representative = Representative.create(representative_params)
    if @representative.save
      redirect_to @representative, notice: "Representative added successfully"
    else
      flash[:alert] = @representative.errors.full_messages.join(', ')
      render :new
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def representative_params
    params.require(:representative).permit(:first_name, :last_name, :office, :email, :party, :bio, :elected, :phone_number, :picture_url)
  end
end
