FactoryBot.define do
  factory :player do
    movie { FactoryBot.create(:movie) }
    user { FactoryBot.create(:user) }
  end
end
