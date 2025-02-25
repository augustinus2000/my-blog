FactoryBot.define do
    factory :post do
      title { "테스트 제목" }
      body { "테스트 본문" }
      category { ["Tech", "Life", "Notice"].sample }
      association :user
    end
  end
  