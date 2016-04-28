class Micropost < ActiveRecord::Base
  validates_presence_of :content
  validates_length_of :content, maximum: 140, message: "less than 140 if you don't mind"
  belongs_to :user
  default_scope ->{ order(created_at: :desc)}
  markable_as :like
end
