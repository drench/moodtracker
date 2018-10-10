class Api::MoodTrackersController < ApplicationController
before_action :authenticate_user, except: [:index, :show]

  def index
    @mood_tracker = MoodTracker.all
    render 'index.json.jbuilder'  
  end

  def create
    @mood_tracker = MoodTracker.new(
                                    user_id: current_user,
                                    emotion: params[:emotion],
                                    proud_message: params[:proud_message]
                                    )
    @mood_tracker.save
    render 'show.json.jbuilder'
  end

  def show
    @mood_tracker = MoodTracker.find(params[:created_at])
    render "show.json.jbuilder"
  end

  def update
    @mood_tracker = MoodTracker.find(params[:created_at])
    @mood_tracker.emotion = params[:emotion] || @mood_tracker.emotion
    @mood_tracker.proud_message = params[:proud_message] || @mood_tracker.proud_message
    @mood_tracker.updated_at = params[:updated_at] || @mood_tracker.updated_at
    @mood_tracker.save
    render "show.json.jbuilder"
  end
   
end
