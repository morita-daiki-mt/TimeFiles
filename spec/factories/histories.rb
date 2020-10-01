FactoryBot.define do
  factory :history do
    action_at {Faker::Date.backward}
    association :task
    user { task.user }
  end
end
