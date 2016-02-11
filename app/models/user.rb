# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  username               :string
#  slug                   :string
#  role_id                :integer
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :username

  extend FriendlyId
  friendly_id :username, use: :slugged

  belongs_to :role
  before_create :set_default_role
  has_many :animelists
  has_many :animes, through: :animelists
  acts_as_marker

  has_attached_file :avatar, styles: { large: "109x109#", thumb: "50x50#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  has_attached_file :header_image, styles: { large: "1920x400#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :header_image, content_type: /\Aimage\/.*\Z/


  private
    def set_default_role
      self.role ||= Role.find_by_name('user')
    end
end
