class Api::UsersController < ApplicationController 

  def index
    @users = User.all
    search_term = params[:search]
    if search_term 
    @users = @users.where(
                          "name iLIKE ?", 
                          "%#{search_term}%", 
                          )
    end
      sort_attribute = params[:sort]
      sort_order = params[:sort_order]
      if sort_attribute && sort_order
        @users = @users.order(sort_attribute => sort_order)
      elsif sort_attribute
        @users = @users.order(sort_attribute)
      end
    render 'index.json.jbuilder'
  end

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

  def show
    @events.all
  end

  def update
    @user = User.all(params[:name])

    @user.name = params[:name] || @user.name
    @user.save
    render "show.json.jbuilder"
  end

  def destroy
    @user = User.find(params[:name])
    @user.destroy
    render json: {message: "User had been successfully removed from your family"}
  end

end