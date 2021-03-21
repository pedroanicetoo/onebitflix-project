FactoryBot.define do
  factory :favorite do
    user { FactoryBot.create(:user) }
    favoritable { FactoryBot.create([:serie, :movie].sample) }
  end
end
