FactoryBot.define do
  factory :history do
    action_at {Faker::Date.backward}
    association :task, factory: :task
  end
end
