class Api::AwardsController < ApplicationController

  def index
    @award = Award.all
    render 'index.json.jbuilder'  
  end

  def show
    @award = Award.find(params[:user_id])
    render "show.json.jbuilder"
  end

end
