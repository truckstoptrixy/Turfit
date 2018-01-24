class PostsController < ApplicationController
  before_action :authenticate_model!
  before_action :owned_post, only: [:edit, :update, :destroy]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = current_model.posts.build
  end

  def create
    @post = current_model.posts.build(post_params)

    if @post.save
      flash[:success] = "Your post has been created!"
      redirect_to posts_path
    else
      flash[:alert] = "Your new post couldn't be created!  Please check the form."
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

  def owned_post
  	unless current_model == @post.model
      flash[:alert] = "That post doesn't belong to you!"
      redirect_to root_path
  	end
  end

end
