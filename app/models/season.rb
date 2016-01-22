class Season < ActiveRecord::Base

  validates_presence_of :name

  has_many :animes

  extend FriendlyId
  friendly_id :name, use: :slugged
end
