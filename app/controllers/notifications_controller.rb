class NotificationsController < ApplicationController

  def new
  end

  def create
    @notification = Notification.new(notification_params)

    if @notification.save
      flash[:success] = "Success!"
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private
  def notification_params
    params.require(:notification).permit(:email)
  end
end
