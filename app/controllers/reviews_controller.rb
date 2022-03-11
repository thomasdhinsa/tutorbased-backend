class ReviewsController < ApplicationController
  before_action :authenticate_user, except: [:index]

  def index
    review = Review.find_by current_user.reviews
    render json review
  end

  def create
   if current_user.is_teacher == false 
    review = Review.new(
      user_id: params[:current_user],
      teacher_id: params[:teacher_id], ### can I do current_teacher?
      rating: params[:rating],
      body: params[:body]
    )
      if review.save
        render json: review
      else
        render json: {errors: review.error.full_messages}, status: :unprocessable_entity
    end 
  else 
    render json: {}, status: :unauthorized 
  end

  def update 
    user = User.find_by is_teacher: false 
    review = Review.find_by.current_user.reviews
    review.rating = params[:rating] || review.rating
    review.body = params[:body] || review.body
    if user.is_teacher == false
      review.save
      render json: review
    else 
      render json: {message: "You're a Teacher."}
  end

  def delete
    review = Review.find_by.current_user
    if review.delete
      render json: {message: "Your Review is Deleted"}
    else 
      render json: {errors: review.error.full_messages}, status: :unauthorized
    end 
  end
end 
end 


end 
