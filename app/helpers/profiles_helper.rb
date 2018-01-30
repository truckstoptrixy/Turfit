module ProfilesHelper
  def current_model_is_following(current_model_id, followed_model_id)
    relationship = Follow.find_by(follower_id: current_model_id, following_id: followed_model_id)
    return true if relationship
  end
end