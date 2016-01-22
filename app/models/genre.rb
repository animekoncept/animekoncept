class Genre < ActiveRecord::Base
  validates_presence_of :name

  belongs_to :anime

  extend FriendlyId
  friendly_id :name, use: :slugged
end
