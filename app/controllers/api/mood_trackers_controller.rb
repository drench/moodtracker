class Api::MoodTrackersController < ApplicationController
before_action :authenticate_user

  def index
    @mood_trackers = MoodTracker.all
    render 'index.json.jbuilder'  
  end

  def create
    @mood_tracker = MoodTracker.new(
                                    user_id: current_user.id,
                                    emotion: params[:emotion],
                                    proud_message: params[:proud_message]
                                    )
    if @mood_tracker.save
      render json: {message: 'Mood entered successfully'}, status: :created
    else
      render json: {errors: @mood_tracker.errors.full_messages}, status: :bad_request
    end
  end

  def show
    @mood_trackers.all
    render "show.json.jbuilder"
  end

  def update
    @mood_tracker = MoodTracker.find(params[:created_at])    
    @mood_tracker.emotion = params[:emotion] || @mood_tracker.emotion
    @mood_tracker.proud_message = params[:proud_message] || @mood_tracker.proud_message
    @mood_tracker.save
    render "show.json.jbuilder"
  end
end
