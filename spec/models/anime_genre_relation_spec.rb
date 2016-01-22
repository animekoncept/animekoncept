require 'rails_helper'

RSpec.describe AnimeGenreRelation, type: :model do
  it {should belong_to(:anime)}
  it {should belong_to(:genre)}
  it {is_expected.to validate_presence_of(:anime_id)}
end
