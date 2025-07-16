FactoryBot.define do
  sequence(:email_address) { |n| "teste#{n}@exemplo.com" }

  factory :user do
    nome {"Julia"}
    email_address { generate(:email_address) }
    password {"123"}
    password_confirmation {"123"}
  end
end