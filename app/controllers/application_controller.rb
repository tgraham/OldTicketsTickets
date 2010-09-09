class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user_session, :current_user, :require_no_user
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "That page is either no longer available or you don't have permission to access it."
    redirect_to root_url
  end

  private
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.user
    end
    
    def require_no_user
      if current_user
        flash[:notice] = "You must be logged out to access this page"
        redirect_to root_url
        return false
      end
    end
end
