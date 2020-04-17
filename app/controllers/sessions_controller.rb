class SessionsController < ApplicationController 
    skip_before_action :authorize, only: [:create, :new]
    def create 
        user = User.find_by(email: params[:email])

        if user&.authenticate(params[:password])
            reset_session
            session[:user_id] = user.id 
            redirect_to posts_url, alert: "Welcome to the best app ever!"
        else
            redirect_to login_url, alert: 'invalid'
        end
    end
    def destroy
        session[:user_id] = nil
        redirect_to login_url, alert: "Logged out" 
    end
end