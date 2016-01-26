# == Schema Information
#
# Table name: animes
#
#  id                       :integer          not null, primary key
#  name                     :string
#  synopsis                 :text
#  aired_on                 :date
#  ended_on                 :date
#  duration                 :string
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  slug                     :string
#  season_id                :integer
#  cover_image_file_name    :string
#  cover_image_content_type :string
#  cover_image_file_size    :integer
#  cover_image_updated_at   :datetime
#

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
