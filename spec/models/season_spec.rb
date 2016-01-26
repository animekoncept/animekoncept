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

require 'rails_helper'

RSpec.describe Season, type: :model do
  it {is_expected.to validate_presence_of(:name)}
  it {should have_many(:animes)}
end
