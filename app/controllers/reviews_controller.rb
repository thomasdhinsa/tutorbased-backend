class ReviewsController < ApplicationController
  



  def create
    review = Review.new(
      user_id: params[:current_user],
      teacher_id: params[:teacher_id],
      rating: params[:rating],
      body: params[:body]
    )
  end

  def update 
    user = User.find_by is_teacher: false 
    review = Review.find_by current_user.reviews
    review.rating = params[:rating] || review.rating
    review.body = params[:body] || review.body
    if user.is_teacher == false
      review.save
      render json: review
    else 
      render json: {message: "You're a Teacher."}
  end

  def delete
    
    
  end

end
