class ArticlesController < ApplicationController
  def new
  end

  def create
    @article = Article.new(params[:article])
    @article.save
    redirect_to @article
  end

  def index
    render :plain => Article.all
  end

end
