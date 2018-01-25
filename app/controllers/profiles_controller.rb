class ProfilesController < ApplicationController

def show
	@model = Model.find_by(user_name: params[:user_name])
  @posts = Model.find_by(user_name: params[:user_name]).posts.order('created_at DESC')
end


end
