class ReviewsController < ApplicationController
  before_action :authenticate_user!
  def show
  end

  def new
    @user = current_user
    @representative = Representative.find(params[:representative_id])
    @review = Review.new
  end

  def create
    @user = current_user
    @representative = Representative.find(params[:representative_id])
    @review = Review.create(review_params)
    @review.representative = @representative
    @review.user = @user

    if @review.save
      redirect_to @representative, notice: "Review added successfully"
    else
      flash[:alert] = @review.errors.full_messages.join(' , ')
      render :new
    end
  end

  def edit
    @representative = Representative.find(params[:representative_id])
    @review = Review.find(params[:id])
    @user = current_user
  end

  def update
    @user = current_user
    @review = Review.find(params[:id])
    @representative = Representative.find(params[:representative_id])

    if @review.update(review_params)
      redirect_to @representative, notice: "Review updated successfully"
    else
      flash[:alert] = @review.errors.full_messages.join(' , ')
      render :edit
    end
  end

  def destroy
    @user = current_user
    @representative = Representative.find(params[:representative_id])
    @review = Review.find(params[:review_id])
    @review.destroy
    redirect_to @representative
  end

  private

   def review_params
     params.require(:review).permit(:headline, :body, :rating)
   end
end
