class Post < ActiveRecord::Base
  validates_presence_of :title
  normalize_attributes :title, :description, :url
  #validates :body, length: { title: 250 }
  #validates :body, length: { description: 1000 }
end
