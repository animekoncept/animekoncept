require 'rails_helper'

RSpec.describe Producer, type: :model do
  it {is_expected.to validate_presence_of(:name)}
  it {should have_and_belong_to_many(:animes)}
end
