class PostsController < ApplicationController

    before_action :require_signin, except: [:index]

    def index
        @post = Post.all
    end

    def show
        @post = Post.find(params[:id])
    end
    
    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        @post.user = current_user

        if @post.save
            redirect_to @post, notice: "Post Added"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])

        if @post.update(post_params)
            redirect_to @post, notice: "Post Updated"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy

        redirect_to root_path
    end
    private
     def post_params
        params.require(:post).permit(:title, :body)
     end
end
