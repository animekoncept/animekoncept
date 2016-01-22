require 'rails_helper'

RSpec.describe Season, type: :model do
  it {is_expected.to validate_presence_of(:name)}
  it {should have_many(:animes)}
end
