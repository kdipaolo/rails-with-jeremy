class UserMailer < ApplicationMailer
    default from: 'noreply@railswithjeremy.com'

    def welcome_email 
        @user = params[:user]
        mail(to: @user.email, subject: "Welcome!")
    end
end
