# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    provider "MyString"
    uid "MyString"
    email "MyString"
    first_name "MyString"
    last_name "MyString"
  end
end
