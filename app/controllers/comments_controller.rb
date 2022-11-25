class CommentsController < ApplicationController

    def create
        @post = Post.find(params[:post_id])
        @comment = Comment.new(comment_params)
        @comment.post = @post
        @comment.user = current_user
        @comment.save
        redirect_to post_path(@post)
        
    end

    private
        def comment_params
            params.require(:comment).permit(:body)
        end
end