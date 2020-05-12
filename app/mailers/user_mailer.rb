class UserMailer < ApplicationMailer
    default from: 'noreply@railswithjeremy.com'

    def welcome_email 
        @user = params[:user]
        
        mail(to: @user.email, subject: "Welcome!")
    end

    def comment_on_post_email 
        @post = params[:post]
        @comment = params[:comment]
        @currentUser = params[:currentUser]

        mail(to: @post.user.email, subject: "#{@currentUser.name} has commented on one of your posts!")
    end

    def forgot_password_email
        @user = params[:user]
        mail(to: "kurt@test.com", subject: "Password Reset")
    end
end
