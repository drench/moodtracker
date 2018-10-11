class Api::MessagesController < ApplicationController
before_action :authenticate_user

  def index
    @message = Message.all
    render 'index.json.jbuilder'  
  end

  def create
    @message = Message.new(
                          user_id: current_user.id,
                          user_id: params[:user_id],
                          thread_id: params[:thread_id],
                          content: params[:content],
                          )
    if @message.save
      render json: {message: 'Message entry successfully'}, status: :created
    else
      render json: {errors: @message.errors.full_messages}, status: :bad_request
    end
  end

  def show
    @message = Message.find(params[:created_at])
    render "show.json.jbuilder"
  end

  def update
    @message = Message.find(params[:created_at])

    @message.user_id = params[:user_id] || @message.user_id
    @message.thread_id = params[:thread_id] || @message.thread_id
    @message.content = params[:content] || @message.content
    @message.created_at = params[:created_at] || @message.created_at
    @message.updated_at = params[:updated_at] || @message.updated_at

    @message.save
    render "show.json.jbuilder"
  end
   
  def destroy
    @message = message.find(params[:created_at])
    @message.destroy
    render json: {message: "Message destroy"}
  end
end
