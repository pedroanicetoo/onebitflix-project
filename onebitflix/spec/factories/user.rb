FactoryBot.define do
  sequence(:email) {|n| "email#{rand(1000000)*n}@factory#{n}.com" }
  sequence(:random_string) {|n| "s#{n*rand(1000000)}a" }
  factory :user do
    email { generate(:email) }
    password { "123456" }
    password_confirmation { |u| u.password }
  end
end
