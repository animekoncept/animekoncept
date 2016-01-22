require 'rails_helper'

RSpec.describe Genre, type: :model do
  it {is_expected.to validate_presence_of(:name)}
  it {should have_many(:anime).through(:anime_genre_relation)}
end
