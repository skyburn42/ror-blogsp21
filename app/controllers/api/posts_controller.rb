class Api::PostsController < ApplicationController
end
class Api::PostsController < ApplicationController
  before_action :set_blog 
  before_action :set_post, except: [:index, :create]
  def index 
    render json: @blog.posts
  end
  def show
    render json: @post
  end
  def create 
    @post = @blog.posts.new(post_params)
    if @post.save
      render json: @post
    else
      render json: { errors: @post.errors }, status: :unprocessable_entity
    end
  end
  def update 
    if @post.update(post_params)
      render json: @post
    else
      render json: { errors: @post.errors }, status: :unprocessable_entity
    end
  end
  def destroy
    @post.destroy
    render json: { message: 'Post deleted' }
  end
  private 
    def post_params
      params.require(:post).permit(:title, :author, :body)
    end
    def set_blog
      @blog = Blog.find(params[:blog_id])
    end
    def set_post
      @post = @blog.posts.find(params[:id])
      # @post = Posts.find(params[:id])
      # @post = current_user.posts.find(params[:id])
    end
end