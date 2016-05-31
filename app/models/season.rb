# == Schema Information
#
# Table name: seasons
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string
#

class Season < ActiveRecord::Base

  #searchkick fields: ["name^10"]

  validates_presence_of :title

  has_many :animes, :dependent => :destroy

  acts_as_punchable

  extend FriendlyId
  friendly_id :title, use: :slugged

  def slug=(value)
    if value.present?
      write_attribute(:slug, value)
    end
  end
end
