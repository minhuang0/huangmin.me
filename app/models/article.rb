class Article < ActiveRecord::Base
  has_one :classification
end
