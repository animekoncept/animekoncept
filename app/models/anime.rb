  class Anime < ActiveRecord::Base

  validates_presence_of :name
  validates_presence_of :synopsis
  validates_presence_of :aired_on
  validates_presence_of :ended_on
  validates_presence_of :duration

  has_many :anime_genre_relation
  has_many :genres, through: :anime_genre_relation

  extend FriendlyId
  friendly_id :name, use: :slugged

  def slug=(value)
    if value.present?
      write_attribute(:slug, value)
    end
  end
end
