# app/controllers/api/api_controller.rb
module Api
    class ApiController < ActionController::API
      # API는 기본적으로 인증을 요구하지 않음
      before_action :authenticate_user!
  
      # JSON 응답을 기본값으로 설정
      rescue_from ActiveRecord::RecordNotFound, with: :not_found
  
      private
  
      def not_found
        render json: { error: "Resource not found" }, status: :not_found
      end
    end
  end
  