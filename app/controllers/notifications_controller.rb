class NotificationsController < ApplicationController
def link_through
  @notification = Notification.find(params[:id])
  @notification.update read: true
  redirect_to post_path @notification.post
end

  def index
    @notifications = current_model.notifications
  end
end
