class Season < ActiveRecord::Base

  validates_presence_of :name

  extend FriendlyId
  friendly_id :name, use: :slugged
end
