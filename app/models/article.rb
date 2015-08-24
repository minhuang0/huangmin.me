class Article < ActiveRecord::Base
  belongs_to :classification
  is_impressionable

  def previous_post
    Article.where("id < ?", self.id).last
  end

  def next_post
    Article.where("id > ?", self.id).first
  end

end
