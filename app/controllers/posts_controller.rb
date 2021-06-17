class PostsController < ApplicationController
    before_action :authenticate, only: [:show, :edit]

    def new
        @post = Post.new
    end
    
    def create
        @post = Post.new(post_params)
        if @post.save
          flash[:success] = "Post successfully created"
          redirect_to @post
        else
          flash[:error] = "Something went wrong, Please Try Again"
          render 'new'
        end
    end
    
    private
    def post_params
        params.require(:post).permit(:post)
    end

end
