class PostsController < ApplicationController
  before_action :authenticate_model!
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    if @post = Post.create(post_params)
      flash[:success] = "Yas meng! Post has been created!"
      redirect_to posts_path
    else
      flash.now[:alert] = "Bummer... new post couldn't be created :(  Check the form."
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:success] = "Awesome!"
      redirect_to posts_path
    else
      flash.now[:alert] = "Oh gosh something is wrong.  Check the form."
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:image, :caption)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
