class UsersController < ApplicationController
  before_action :authenticate_user, only: [:update, :destroy]
  

  def index
    teachers = User.where is_teacher: true
    render json: teachers
  end

  def show
    id = params[:id].to_i
    teacher = User.find_by id: id
    render json: teacher
  end 
  

  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      is_teacher: params[:is_teacher],
      education: params[:education],
      bio: params[:bio],
      subjects: params[:subjects],
      zipcode: params[:zipcode],
      preferred_contact: params[:preferred_contact],
      image_url: params[:image_url]
    )
    if user.save
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

    def update
      user = User.find(params[:id])
        user.name = params[:name] || user.name
        user.email = params[:email] || user.email
        user.education = params[:education] || user.education
        user.bio = params[:bio] || user.bio
        user.subjects = params[:subjects] || user.subjects
        user.zipcode = params[:zipcode] || user.zipcode
        user.preferred_contact = params[:preferred_contact] || user.preferred_contact
        user.image_url = params[:image_url] || user.image_url
        if user.save 
          render json: { message: "User updated successfully" }, status: :accepted
        else 
          render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end 
    end

    def destroy
      user = current_user 
      user.delete
      render json: "Your account is deleted. Have a great day!"
    end
end
