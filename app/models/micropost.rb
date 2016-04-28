class Micropost < ActiveRecord::Base
  validates_presence_of :content
  belongs_to :user
  default_scope ->{ order(created_at: :desc)}
  markable_as :like
end
