class Admin::DashboardController < Admin::ApplicationController
  def index
    @articles = Article.all
  end
end
