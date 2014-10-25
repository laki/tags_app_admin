class Post < ActiveRecord::Base
  normalize_attributes :title, :description, :url
end
