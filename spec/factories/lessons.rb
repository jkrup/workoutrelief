# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :lesson do
    date "2013-03-26 18:08:43"
    price "9.99"
    description "MyText"
    tutor nil
    student nil
    tokbox "MyString"
    planned_duration 1
    actual_duration 1
    rating 1
  end
end
