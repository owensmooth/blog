class Admin::ArticlesController < Admin::BaseController
  before_action :params_id, only: [:show, :edit]
  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to admin_articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end

    def params_id
      @article = Article.find(params[:id])
    end
end
