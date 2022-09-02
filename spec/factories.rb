FactoryBot.define do
  factory :question do
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraph }
  end
  factory :user do

  end
end
