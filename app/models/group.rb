class Group < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title
  validates_uniqueness_of :title

  validates_presence_of :bio
  validates_presence_of :summary

  belongs_to :user


  has_attached_file :avatar,
                    styles: { large: "200x288#", medium: "162x230#", thumb: "100x100#", mobile: "350x444" },
                    processors: [:thumbnail, :paperclip_optimizer]
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  has_attached_file :header_image,
                    styles: { large: "1920x600#", medium: "1920x850#" },
                    processors: [:thumbnail, :paperclip_optimizer]
  validates_attachment_content_type :header_image, content_type: /\Aimage\/.*\Z/
end
