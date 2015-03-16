# -*- encoding : utf-8 -*-
class ArticlesController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "Hmpwis&", except: [:index, :show]
  def new
    @article = Article.new
  end

  def index
    @articles = Article.all
  end

  def create
    @article = Article.new(article_params)
    @article.save

    redirect_to @article
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
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
    redirect_to articles_path
  end

private
def article_params
  params.require(:article).permit(:title, :text)
end
end
