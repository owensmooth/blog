class NotificationsController < ApplicationController

  def new
    @notification = Notification.new
  end

  def create
    @notification = Notification.new(notification_params)

    if @notification.save
      flash[:success] = "Success!"
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def notification_params
    params.require(:notification).permit(:email)
  end
end
