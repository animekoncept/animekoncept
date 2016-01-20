require 'rails_helper'

RSpec.describe Anime, type: :model do
  it  {is_expected.to validate_presence_of(:name)}
  it  {is_expected.to validate_presence_of(:synopsis)}
  it  {is_expected.to validate_presence_of(:aired_on)}
  it  {is_expected.to validate_presence_of(:ended_on)}
end
