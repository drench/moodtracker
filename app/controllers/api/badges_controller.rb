class Api::BadgesController < ApplicationController

  def index
    @badge = Badge.all
    render 'index.json.jbuilder'  
  end

  def show
    @badge = Badge.find(params[:user_id])
    render "show.json.jbuilder"
  end
end
