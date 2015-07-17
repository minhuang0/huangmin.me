class AddClassificationIdToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :classification_id, :integer
  end
end
