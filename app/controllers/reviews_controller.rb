class ReviewsController < ApplicationController
  def show
  end

  def new
    @representative = Representative.find(params[:representative_id])
    @review = Review.new
  end

  def create
    @representative = Representative.find(params[:representative_id])
    @review = Review.create(review_params)
    @review.representative = @representative
    if @review.save
      redirect_to @representative, notice: "Review added successfully"
    else
      flash[:alert] = @review.errors.full_messages.join(' , ')
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

   def review_params
     params.require(:review).permit(:headline, :body, :rating)
   end
end
