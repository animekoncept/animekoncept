# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  location    :string
#  starts_on   :date
#  ends_on     :date
#  age         :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Event < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :location
  validates_presence_of :starts_on
  validates_presence_of :ends_on
  validates_presence_of :age


  include PublicActivity::Common
  


  acts_as_punchable

  markable_as :attending

  has_attached_file :header_image, styles: { large: "1920x600#", medium: "1920x850#" }
  validates_attachment_content_type :header_image, content_type: /\Aimage\/.*\Z/
end
