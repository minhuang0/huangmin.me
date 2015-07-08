class NotesController < ApplicationController
  def index
    @notes = Article.all.reverse
  end

  def show
    @note = Article.find(params[:id])
  end
end
