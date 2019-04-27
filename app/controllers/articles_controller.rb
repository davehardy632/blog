class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :destroy, :edit, :update]

  def index
    @articles = Article.all
  end

  def show
    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    flash[:notice] = "Article #{@article.title} has been Created"
    redirect_to article_path(@article)
  end

  def edit
  end

  def update
    @article.update(article_params)
    flash[:notice] = "Article #{@article.title} has been Updated"
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.delete
    flash[:notice] = "Article has been Deleted"
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :tag_list)
  end

  def set_article
    @article = Article.find(params[:id])
  end

end
