class Genre < ActiveRecord::Base
  validates_presence_of :name

  has_and_belongs_to_many :animes

  extend FriendlyId
  friendly_id :name, use: :slugged

  def slug=(value)
    if value.present?
      write_attribute(:slug, value)
    end
  end
end
