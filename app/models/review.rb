class Review < ActiveRecord::Base
  belongs_to :anime
  belongs_to :user

  validates_presence_of :story
  validates_presence_of :art
  validates_presence_of :sound
  validates_presence_of :character
  validates_presence_of :enjoyment
  validates_presence_of :overall
  validates_presence_of :content
end
