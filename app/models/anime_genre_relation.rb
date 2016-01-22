class AnimeGenreRelation < ActiveRecord::Base

  validates_presence_of :anime_id
  validates_presence_of :genre_id

  belongs_to :anime
  belongs_to :genre
end
