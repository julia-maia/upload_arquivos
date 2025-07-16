FactoryBot.define do
  factory :item do
    price {10}
    description {"teste"}
    association :user
    association :merchant
  end
end