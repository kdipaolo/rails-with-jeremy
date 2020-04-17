class UsersController < ApplicationController 
    skip_before_action :authorize, only: [:create, :new]
    def create 
        @user = User.new(user_params)
        
        if @user.save
            reset_session
            session[:user_id] = @user.id
            redirect_to posts_url, notice: "Hello #{@user.email}, welcome!"
        end
        
    end

    def user_params
        params.permit(:email, :password, :name, :password_confirmation)
    end
end