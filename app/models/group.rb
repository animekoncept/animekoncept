class Group < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title
  validates_uniqueness_of :title

  validates_presence_of :bio
  validates_presence_of :summary

  validates_length_of :bio, :minimum => 5, :maximum => 60
  validates_length_of :title, :minimum => 5, :maximum => 20

  belongs_to :user


  has_attached_file :avatar,
                    styles: { large: "200x200#", medium: "162x162#", thumb: "100x100#", mobile: "350x350" },
                    processors: [:thumbnail, :paperclip_optimizer]
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  has_attached_file :header_image,
                    styles: { large: "1920x600#", medium: "1920x850#" },
                    processors: [:thumbnail, :paperclip_optimizer]
  validates_attachment_content_type :header_image, content_type: /\Aimage\/.*\Z/
end
