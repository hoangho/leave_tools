# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :leave_request do
    title "MyString"
    content "MyText"
    user_id 1
    appover_id 1
    leave_type_id 1
    is_approved false
    start_time "2013-03-13 14:57:31"
    end_time "2013-03-13 14:57:31"
  end
end
