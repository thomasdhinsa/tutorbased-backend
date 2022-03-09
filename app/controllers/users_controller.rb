class UsersController < ApplicationController

  def index
    teachers = User.find_by is_teacher: true
    render json: teachers
  end

  def show
    id = params[:id].to_i
    teachers = User.find_by is_teacher: true
    teacher = teachers.find_by(id: id)
    render json: teacher
  end ## ??????
  

  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
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

    def update
      teacher = User.find_by is_teacher: true 
      user = User.find(params[:id])
        user.name: params[:name],
        user.email: params[:email],
        user.password: params[:password],
        is_teacher: params[:is_teacher],
        teacher.education: params[:education],
        teacher.bio: params[:bio],
        teacher.subjects: params[:subjects],
        teacher.zipcode: params[:zipcode],
        teacher.preferred_contact: params[:preferred_contact],
        user.image_url: params[:image_url]
      )
    end

    def destroy
      user = current_user 
      user.delete
      render json: "Your account is deleted. Have a great day!"
    end






  end








  
end
