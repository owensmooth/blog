class Admin::DashboardController < Admin::ApplicationController
  def index
    @articles = Article.all
    @users = User.all
  end
end
