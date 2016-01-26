# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  location    :string
#  date_on     :date
#  start_at    :datetime
#  end_at      :datetime
#  age         :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Event, type: :model do
  it {is_expected.to validate_presence_of(:name)}
  it {is_expected.to validate_presence_of(:description)}
  it {is_expected.to validate_presence_of(:location)}
  it {is_expected.to validate_presence_of(:date_on)}
  it {is_expected.to validate_presence_of(:start_at)}
  it {is_expected.to validate_presence_of(:end_at)}
end
