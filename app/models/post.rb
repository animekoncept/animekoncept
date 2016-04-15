class Post < ActiveRecord::Base
  validates_presence_of :content
  belongs_to :topic
  belongs_to :user
  belongs_to :category
  scope :descending, ->() { order(arel_table[:created_at].desc) }
end
