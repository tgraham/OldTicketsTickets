class StaticController < ApplicationController

  def index
  end
  
  def dashboard
    unless current_user
      redirect_to root_path
      return
    else
      @view = params[:view]
      @user = current_user
      @tickets = Ticket.paginate :page => params[:page]
      @assets = Asset.paginate :page => params[:page]
    end
  end
  
  def admin_dashboard
    unless current_user && current_user.is_admin?
      redirect_to root_path
      return
    else
      @view = env['PATH_INFO'].gsub('/', '')
      @users = User.paginate :page => params[:page]
      @companies = Company.paginate :page => params[:page]
    end
    render 'dashboard'
  end
end
