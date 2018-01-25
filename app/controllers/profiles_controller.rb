class ProfilesController < ApplicationController

  before_action :authenticate_model!
  before_action :set_model
  before_action :owned_profile, only: [:edit, :update]

  def show
    @posts = @model.posts.order('created_at DESC')
  end

  def edit
  end

  def update
    if @model.update(profile_params)
      flash[:success] = 'Your profile has been updated.'
      redirect_to profile_path(@model.user_name)
    else
      @model.errors.full_messages
      flash[:error] = @model.errors.full_messages
      render :edit
    end
  end

  private

  def profile_params
    params.require(:model).permit(:avatar, :bio)
  end

  def owned_profile
    unless current_model == @model
      flash[:alert] = "That profile doesn't belong to you!"
      redirect_to root_path
    end
  end

  def set_model
    @model = Model.find_by(user_name: params[:user_name])
  end

end