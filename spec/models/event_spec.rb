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

require 'rails_helper'

RSpec.describe Event, type: :model do
  it {is_expected.to validate_presence_of(:name)}
  it {is_expected.to validate_presence_of(:description)}
  it {is_expected.to validate_presence_of(:location)}
  it {is_expected.to validate_presence_of(:starts_on)}
  it {is_expected.to validate_presence_of(:ends_on)}
  it {is_expected.to validate_presence_of(:age)}
end
