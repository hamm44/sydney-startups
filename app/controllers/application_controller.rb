class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :logged_in?
  layout :set_layout

  private
    def set_layout
      if request.headers['X-PJAX'] || params[:_pjax] == true
        false
      else
        "application"
      end
    end

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def login_required
      return if logged_in?
      flash[:error] = "Not logged in."
      redirect_to root_path
      return false
    end

    def logged_in?
      !!current_user
    end

    def logout
      session[:user_id] = nil
      redirect_to root_url
    end
end
