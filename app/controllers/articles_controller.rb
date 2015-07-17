# -*- encoding : utf-8 -*-
class ArticlesController < ApplicationController
  before_action :authenticate_user!
  def new
    @article = Article.new
    @classifications = Classification.all
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
    @classifications = Classification.all
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
