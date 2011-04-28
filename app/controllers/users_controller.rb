class UsersController < ApplicationController
  load_and_authorize_resource
  
  def index
    if current_user.is_user?
      redirect_to '/account'
    else
      @users = User.page(params[:page])
    end
  end
  
  def new
    @view = 'user'
  end
  
  def create
    @user = User.new(params[:user])
    @user.role = 'user'
    if @user.save
      # Notifier.welcome_email(@user).deliver
      flash[:notice] = "Successfully created account."
      redirect_to '/user'
    else
      render :action => 'new'
    end
  end
  
  def edit
    @view = 'account'
  end
  
  def update
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated account."
      if current_user.is_admin?
        redirect_to '/user'
      else
        redirect_to '/account'
      end
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @user.destroy
    flash[:notice] = "Successfully removed user."
    redirect_to '/user'
  end
end
