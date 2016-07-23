class PostsController < ApplicationController
  def index
    @posts = Post.all.paginate(page: params[:page], per_page: 10).decorate
  end

  def show
    @post = Post.find(params[:id]).decorate
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
  end

  protected

  def post_params
    params.require(:post).permit(:title, :description, :location)
  end
end
