# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :discussion_response do
    content "MyText"
    discussion_id 1
  end
end
