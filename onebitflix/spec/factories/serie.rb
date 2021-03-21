FactoryBot.define do
  factory :serie do
    title { FFaker::Lorem.word }
    description { FFaker::Lorem.word }
    category_id { FactoryBot.create(:category).id }
    thumbnail_key { FFaker::Lorem.word }
    featured_thumbnail_key { FFaker::Lorem.word }
    thumbnail_cover_key { FFaker::Lorem.word }
  end
end
