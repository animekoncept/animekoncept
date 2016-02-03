# == Schema Information
#
# Table name: animes
#
#  id                       :integer          not null, primary key
#  name                     :string
#  synopsis                 :text
#  aired_on                 :date
#  ended_on                 :date
#  duration                 :string
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  slug                     :string
#  season_id                :integer
#  cover_image_file_name    :string
#  cover_image_content_type :string
#  cover_image_file_size    :integer
#  cover_image_updated_at   :datetime
#

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

  has_attached_file :cover_image, styles: { large: "200x288#", medium: "162x230>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :cover_image, content_type: /\Aimage\/.*\Z/

  has_attached_file :header_image, styles: { large: "1920x600#", medium: "1920x800#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :header_image, content_type: /\Aimage\/.*\Z/
end
