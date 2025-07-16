FactoryBot.define do
  factory :purchaser do
    name {"Amanda"}
    association :user
  end
end