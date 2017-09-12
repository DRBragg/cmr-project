class RepresentativesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @user = current_user
    @representatives = Representative.all
    if params[:search]
      @representatives = Representative.search(params[:search]).order("created_at DESC")
      if @representatives.empty?
        flash[:warning] = "There are no representatives matching your search"
      end
    else
      @representatives = Representative.all.order("created_at DESC")
    end
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

  def edit
    @representative = Representative.find(params[:id])
  end

  def update
    @representative = Representative.find(params[:id])

    if @representative.update(representative_params)
      redirect_to root_path, notice: "Representative updated successfully"
    else
      flash[:alert] = @representative.errors.full_messages.join(' , ')
      render :edit
    end
  end

  def destroy
    @representative = Representative.find(params[:id])
    @representative.destroy
    redirect_to root_path
  end

  private

  def representative_params
    params.require(:representative).permit(:first_name, :last_name, :office, :email, :party, :bio, :elected, :phone_number, :picture_url)
  end
end
