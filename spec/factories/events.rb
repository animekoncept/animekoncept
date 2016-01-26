# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  location    :string
#  starts_on   :date
#  ends_on     :date
#  age         :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :event do
    name        {Factory::Name.name}
    description {Factory::Internet.description}
    location    {Factory::Internet.location}
    starts_on   {Factory::Date.between(2.days.ago, Date.today)}
    ends_on     {Factory::Date.between(2.days.ago, Date.today)}
    age         {Factory::Internet.age}
  end

end
