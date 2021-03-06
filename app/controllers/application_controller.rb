class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :require_login

  private

    def require_login
      unless current_user
        redirect_to welcome_path
      end
    end

    def authorised
      unless current_user.admin
        redirect_to welcome_path
      end
    end

end
