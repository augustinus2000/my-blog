FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { "password" }  # Devise 사용 시 필요
    password_confirmation { "password" }
    views { 0 }  # UsersController에서 views 카운트 증가를 위해 필요
  end
end
