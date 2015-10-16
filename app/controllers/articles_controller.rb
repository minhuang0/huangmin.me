# -*- encoding : utf-8 -*-
class ArticlesController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show,:welcome]
  impressionist :actions=>[:show,:index,:welcome]

  def new
    @article = Article.new
    @classifications = Classification.all
  end

  def index
    @classification = Classification.find_by_name(params[:classification_name])
    @articles = @classification.articles.all.order('created_at DESC')
    @all_articles_impressionist_counts_ip = 0
    @all_articles_impressionist_counts_num = 0
    @articles.each do |article|
        @all_articles_impressionist_counts_ip += article.impressionist_count(:filter=>:ip_address).to_i
        @all_articles_impressionist_counts_num += article.impressionist_count().to_i
    end
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to @article
  end

  def show
    @article = Article.find(params[:id])
    @article.impressionist_count(:filter=>:ip_address)
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
      redirect_to :back
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  def welcome
    render 'welcome'
  end

  def markdown
    render 'markdown'
  end

  private
  def article_params
    params.require(:article).permit(:title, :text, :classification_id)
  end
end
