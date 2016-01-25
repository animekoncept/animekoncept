  class Anime < ActiveRecord::Base

  validates_presence_of :name
  validates_presence_of :synopsis
  validates_presence_of :aired_on
  validates_presence_of :ended_on
  validates_presence_of :duration

  belongs_to :season
  has_and_belongs_to_many :genres
  has_and_belongs_to_many :producers

  extend FriendlyId
  friendly_id :name, use: :slugged

  def slug=(value)
    if value.present?
      write_attribute(:slug, value)
    end
  end
end
