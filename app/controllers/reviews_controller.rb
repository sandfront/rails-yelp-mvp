class ReviewsController < ApplicationController

  before_action :select_restaurant

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.valid?
      @review.save
      redirect_to restaurant_path(params[:restaurant_id])
    else
      render 'new'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def select_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
