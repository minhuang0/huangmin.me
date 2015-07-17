# -*- encoding : utf-8 -*-
class Interface::ArticlesController < ActionController::Base
  def all_articles
    titles = Article.all.order(created_at: :desc).map do |article|
      {
        :id => article.id,
        :title => article.title,
        :classification => article.classification.name,
        :created_at => article.created_at.strftime("%m-%d %Y")
      }
    end
    render :json =>{
      result: titles
    }
  end

  def article_details
    article = Article.find params[:article_id]
    render :json => {
      result: article
    }
  end

end
