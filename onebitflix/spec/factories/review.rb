FactoryBot.define do
  factory :review do
    reviewable { FactoryBot.create([:serie, :movie].sample) }
    user { FactoryBot.create(:user) }
    rating { 1 + rand(4) }
    description { FFaker::Lorem.characters(50 + rand(100)) }
  end
end
