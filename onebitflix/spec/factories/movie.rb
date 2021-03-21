FactoryBot.define do
  factory :movie do
    title { FFaker::Lorem.word }
    description { FFaker::Lorem.word }
    category_id { FactoryBot.create(:category).id }
    featured_thumbnail_key { FFaker::Lorem.word }
    thumbnail_cover_key { FFaker::Lorem.word }
    video_key { FFaker::Lorem.word }
  end
end
