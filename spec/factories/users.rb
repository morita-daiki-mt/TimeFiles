FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "Test#{n}@example.com" }
    password { "testuser" }
  end
end
