  class Anime < ActiveRecord::Base

  validates_presence_of :name
  validates_presence_of :synopsis
  validates_presence_of :aired_on
  validates_presence_of :ended_on
  validates_presence_of :duration

  belongs_to :season
  has_many :genres

  extend FriendlyId
  friendly_id :name, use: :slugged
end
