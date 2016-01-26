# == Schema Information
#
# Table name: animes
#
#  id         :integer          not null, primary key
#  name       :string
#  synopsis   :text
#  aired_on   :date
#  ended_on   :date
#  duration   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string
#  season_id  :integer
#

require 'rails_helper'

RSpec.describe Anime, type: :model do
  it  {is_expected.to validate_presence_of(:name)}
  it  {is_expected.to validate_presence_of(:synopsis)}
  it  {is_expected.to validate_presence_of(:aired_on)}
  it  {is_expected.to validate_presence_of(:ended_on)}
  it  {should belong_to(:season)}
  it  {should have_and_belong_to_many(:genres)}
  it  {should have_and_belong_to_many(:producers)}
end
