class Api::BadgesController < ApplicationController

  def index
    @badge = Badge.all
    render 'index.json.jbuilder'  
  end

  def badgeTracker 
  array = user.mood_trackers.order(:created_at).map {|mood_tracker| mood_tracker.created_at.day} 
  
    consistant_run = 0
    last_date = 0
    longest_run = 0

    array.each do |day|
      if last_date + 1 == day
        last_date + 1 
        consistant_run += 1
      end
    if consistant_run > longest_run
      longest_run = consistant_run
    else
      consistant_run = 0
    end
    last_date = day
    end
    longest_run = 0
  end

  def show
    @badge = Badge.find(params[:user_id])
    render "show.json.jbuilder"
  end
end
