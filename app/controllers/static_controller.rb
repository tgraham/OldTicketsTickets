class StaticController < ApplicationController

  def index
  end
  
  def dashboard
    @view = params[:view]
    @user = current_user
    @users = User.paginate :page => params[:page]
    @companies = Company.paginate :page => params[:page]
    @tickets = Ticket.paginate :page => params[:page]
  end
end
