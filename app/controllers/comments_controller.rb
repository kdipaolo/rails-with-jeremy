class CommentsController < ApplicationController
    def create 
        @post = Post.find(params[:post_id])
        @comment = @post.comments.build(comment_params.merge({user: current_user}))
        if @comment.save
            if @post.user 
                UserMailer.with(post: @post, comment: @comment, currentUser: current_user).comment_on_post_email.deliver_later 
            end
                redirect_to @post
            
        else
            @comments = @post.comments
            render '/posts/show'
        end

    end

    def comment_params  
        params.require(:comment).permit(:body)
    end
end
