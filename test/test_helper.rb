ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    parallelize(workers: :number_of_processors)

    # FactoryBot을 쉽게 사용하도록 설정
    include FactoryBot::Syntax::Methods

    # Devise Helper 추가 (로그인 기능이 필요한 경우)
    include Devise::Test::IntegrationHelpers
  end
end
