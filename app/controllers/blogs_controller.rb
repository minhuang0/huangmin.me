class BlogsController < ApplicationController
  def index
    @blogs = Article.all.reverse
  end

  def show
    @blog = Article.find(params[:id])
  end
end
