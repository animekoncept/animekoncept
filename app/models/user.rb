class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :username

  extend FriendlyId
  friendly_id :username, use: :slugged

  belongs_to :role
  before_create :set_default_role


  private
    def set_default_role
      self.role ||= Role.find_by_name('user')
    end
end
