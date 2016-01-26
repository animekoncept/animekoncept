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
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :location
  validates_presence_of :starts_on
  validates_presence_of :ends_on
  validates_presence_of :age
end
