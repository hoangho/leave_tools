# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name "MyString"
    last_name "MyString"
    email "MyString"
    admin false
    balance 1.5
    password "MyString"
    password_confirmation "MyString"
  end
end
