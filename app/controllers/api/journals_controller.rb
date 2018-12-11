class Api::JournalsController < ApplicationController
before_action :authenticate_user
  
  def index
    @journals = Journal.all
    render 'index.json.jbuilder'  
  end

  def create
    @journal = Journal.new(
                          user_id: current_user.id,
                          title: params[:title],
                          content: params[:content], 
                          created_at: friendly_time,
                          )
    if @journal.save
      render json: {message: 'Journal entry successfully'}, status: :created
    else
      render json: {errors: @journal.errors.full_messages}, status: :bad_request
    end
  end

  def show
    # [@drench] I'd go with params[:id] here if possible since we can't count
    # on created_at being unique.
    @journal = Journal.find(params[:created_at])
    render 'show.json.jbuilder'
  end

  def update
    # [@drench] Should a user be allowed to update a Journal belonging to another user?
    # Would you be up for adding some tests if we have time?
    @journal = Journal.find(params[:created_at])

    @journal.title = params[:title] || @journal.title
    @journal.price = params[:content] || @journal.content
    @journal.updated_at = params[:updated_at] || @journal.updated_at

    @journal.save
    render 'show.json.jbuilder'
  end
   
  def destroy
    # [@drench] Similar question: should a user be allowed to destroy a Journal
    # belonging to another user?
    @journal = journal.find(params[:created_at])
    @journal.destroy
    render json: {message: "Journal entry has been removed"}
  end

end
