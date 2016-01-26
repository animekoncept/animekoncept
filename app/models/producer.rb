# == Schema Information
#
# Table name: producers
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string
#

class Producer < ActiveRecord::Base

  validates_presence_of :name

  extend FriendlyId
  friendly_id :name, use: :slugged

  def slug=(value)
    if value.present?
      write_attribute(:slug, value)
    end
  end

  has_and_belongs_to_many :animes
end
