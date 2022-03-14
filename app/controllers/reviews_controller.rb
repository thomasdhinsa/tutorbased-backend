class ReviewsController < ApplicationController
  before_action :authenticate_user

  # def index
  #   review = Review.find_by current_user.reviews
  #   render json review
  # end

  def create
    review = Review.new(
      user_id: current_user.id,
      teacher_id: params[:teacher_id], 
      rating: params[:rating],
      body: params[:body]
    )
    if review.save
      render json: review
    else
      render json: {errors: review.errors.full_messages}, status: :unprocessable_entity
    end 
  end

  def update
    review = current_user.reviews.find params[:id]
    review.rating = params[:rating] || review.rating
    review.body = params[:body] || review.body
    if review.save
      render json: review
    else 
      render json: {errors: review.errors.full_messages}, status: :unprocessable_entity
    end
  end 

  def destroy
    review = current_user.reviews.find params[:id]
    review.destroy
    render json: {message: "Your Review is Deleted"}
  end



end 


