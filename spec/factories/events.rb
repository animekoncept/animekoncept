# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  location    :string
#  date_on     :date
#  start_at    :datetime
#  end_at      :datetime
#  age         :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :event do
    name "MyString"
description "MyText"
location "MyString"
date_on "2016-01-26"
start_at "2016-01-26 09:08:35"
end_at "2016-01-26 09:08:35"
hosting "MyString"
attire "MyString"
price 1
age "MyString"
  end

end
