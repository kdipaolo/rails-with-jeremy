class UsersController < ApplicationController 
    def create 
        puts 'whaaa'
        puts user_params

        @user = User.new(user_params)
        @user.save


    end

    def user_params
        params.permit(:email, :password, :name, :password_confirmation)
    end
end