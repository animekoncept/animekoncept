class Genre < ActiveRecord::Base
  validates_presence_of :name

  has_many :anime_genre_relation
  has_many :anime, through: :anime_genre_relation

  extend FriendlyId
  friendly_id :name, use: :slugged
end
