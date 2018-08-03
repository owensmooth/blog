class Admin::DashboardController < Admin::BaseController
  def index
    @articles = Article.all
    @users = User.all
  end
end
