class Article < ActiveRecord::Base
  belongs_to :classification

  def previous_post
    Article.where("id < ?", self.id).last
  end

  def next_post
    Article.where("id > ?", self.id).last
  end

end
