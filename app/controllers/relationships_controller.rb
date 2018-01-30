class RelationshipsController < ApplicationController
  def follow_model
    @model = Model.find_by! user_name: params[:user_name]
    if current_model.follow @model.id
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    end
  end

  def unfollow_model
    @model = Model.find_by! user_name: params[:user_name]
    if current_model.unfollow @model.id
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    end
  end
end