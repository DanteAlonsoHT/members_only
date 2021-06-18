class PostsController < ApplicationController
    before_action :authenticate_user!, only: [:edit, :update, :show, :destory]
    before_action :authenticate, only: [:show, :edit]

    def index
        @posts = Post.all
    end

    def new
        @post = Post.new
    end
    
    def create
        @post = Post.new(post_params)
    
        respond_to do |format|
          if @post.save
            format.html { redirect_to posts_path, notice: 'Post was successfully created.' }
            format.json { render :index, status: :created, location: @post }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @post.errors, status: :unprocessable_entity }
          end
        end
    end
    
    private
    def post_params
        params.require(:post).permit(:title, :author, :body, :location, :user_id)
    end

end
