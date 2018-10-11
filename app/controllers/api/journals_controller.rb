class Api::JournalsController < ApplicationController
before_action :current_user
  
  def index
    @journal = Journal.all
    render 'index.json.jbuilder'  
  end

  def create
    @journal = Journal.new(
                          user_id: current_user.id,
                          title: params[:title],
                          content: params[:content],
                          )
    if @journal.save
      render json: {message: 'Journal entry successfully'}, status: :created
    else
      render json: {errors: @journal.errors.full_messages}, status: :bad_request
    end
  end

  def show
    @journal = Journal.find(params[:created_at])
    render 'show.json.jbuilder'
  end

  def update
    @journal = Journal.find(params[:created_at])

    @journal.title = params[:title] || @journal.title
    @journal.price = params[:content] || @journal.content
    @journal.updated_at = params[:updated_at] || @journal.updated_at

    @journal.save
    render 'show.json.jbuilder'
  end
   
  def destroy
    @journal = journal.find(params[:created_at])
    @journal.destroy
    render json: {message: "Journal entry has been removed"}
  end

end
