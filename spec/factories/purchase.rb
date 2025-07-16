FactoryBot.define do
  factory :purchase do
    count { 2 }
    association :item
    association :user
    association :purchaser
  end
end