class CommentsController < ApplicationController
    def create 
        @post = Post.find(params[:post_id])

        final_params = {"body"=> comment_params[:body], "user_id" => current_user[:id]}
        @comment = @post.comments.build(final_params)
        
        if @comment.save 
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
