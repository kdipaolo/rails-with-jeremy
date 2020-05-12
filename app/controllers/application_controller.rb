class ApplicationController < ActionController::Base
    before_action :authorize

    def authorize
        redirect_to login_url, alert: "You must be logged in" if current_user.nil?
    end
    def alread_logged_in
        redirect_to login_url, alert: "You are already logged in" if current_user
    end
    def current_user 
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    helper_method :current_user

end
