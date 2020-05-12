class PasswordsController < ApplicationController
  skip_before_action :authorize, only: [:show, :create, :edit, :update]
  before_action :alread_logged_in, only: [:show]

    # going to /password to enter in email to send password reset instructions
    def show
      
    end

    # adding token/set at values to user and sending email out once email is supplied
    def create 
      user = User.find_by(email: params[:email])
      if user
        if user.update(password_reset_token: unique_token, passwoord_reset_set_at: Time.zone.now)
          UserMailer.with(user: user).forgot_password_email.deliver_later 
        end
      end
      redirect_to login_path, notice: "If you have an account, you will get an email with instructions on how to reset your password."
    end

    # the view the user sees when they click on the link in the email to reset password
    def edit 
      @user = User.find_by(password_reset_token: params[:password_reset_token])
      @user.email = ""
      # TODO: Check for expired link
      # two_hours_ago = DateTime.now - (2/24.0)
      # expired = @user.passwoord_reset_set_at > two_hours_ago
      
      redirect_to login_path, notice: "Expired link." if !@user 
    end

    # actually reseting password 
    def update 
      @user = User.find_by(password_reset_token: params[:password_reset_token], email: user_params[:email])
      if @user && @user.update(user_params)
        redirect_to login_path, notice: "your password has been updated!"
      else
        render :edit, notice: 'Somting wong'
      end
      
    end

    private
    
    def user_params 
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

    def unique_token
      SecureRandom.base58(24)
    end


  end
  