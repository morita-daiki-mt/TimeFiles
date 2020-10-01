FactoryBot.define do
  factory :task do
    sequence(:content) { |n| "Task #{n}" }
    icon { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.png'), 'image/png') }
    memo { Faker::ChuckNorris.fact }
    association :user
  end
end
