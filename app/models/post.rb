class Post < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  belongs_to :category
end
