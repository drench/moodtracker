class Api::BadgesController < ApplicationController

  def index
    @badge = Badges.all
    render 'index.json.jbuilder'  
  end

  def show
    @badge = Badges.find(params[:user_id])
    render "show.json.jbuilder"
  end
end
