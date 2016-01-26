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

FactoryGirl.define do
  factory :season do
    name  {Faker::Name.name}
  end

end
