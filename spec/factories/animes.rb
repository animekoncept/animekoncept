FactoryGirl.define do
  factory :anime do
    name      {Faker::Name.name}
    synopsis  {Faker::Internet.synopsis}
    aired_on  {Faker::Internet.aired_on}
    ended_on  {Faker::Internet.ended_on}
    duration  {Faker::Internet.duration}
    season_id {Faker::Internet.season_id}
  end

end
