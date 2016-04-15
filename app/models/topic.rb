class Topic < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :content
  belongs_to :category
  belongs_to :user
  has_many :posts

  acts_as_punchable

  scope :descending, ->() {
    joins(:posts).merge( Post.descending )
  }
end
