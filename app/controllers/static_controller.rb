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
      @tickets = Ticket.page(params[:page])
      @assets = Asset.page(params[:page])
    end
  end
  
  def admin_dashboard
    unless current_user && current_user.is_admin?
      redirect_to root_path
      return
    else
      @view = env['PATH_INFO'].gsub('/', '')
      @users = User.page(params[:page]).per(2)
      @companies = Company.page(params[:page]).per(1)
    end
  end
end
