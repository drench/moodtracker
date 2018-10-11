class Api::UsersController < ApplicationController
  def create
    if params[:new_family] == "true"
      family = Family.create
      user_info = {
                  name: params[:name],
                  family_id: family.id,
                  password: params[:password],
                  password_confirmation: params[:password_confirmation]
                  }
    else
      user_info = {
                  name: params[:name],
                  family_id: params[:family_id],
                  password: params[:password],
                  password_confirmation: params[:password_confirmation]
                  }
    end

    user = User.new(user_info)

    if user.save
      render json: {message: 'User created successfully'}, status: :created
    else
      render json: {errors: user.errors.full_messages}, status: :bad_request
    end
  end


  helper_method :current_user
  def authenticate_user
    unless current_user
    render json: {}, status: :unauthorized
    end
  end 
end