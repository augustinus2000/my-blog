class UsersController < ApplicationController
  before_action :set_user, only: [:profile]

  def profile
    @user.update(views: @user.views + 1)
  end

  private

  def set_user
    @user = User.find_by(id: params[:id]) # id가 없는 경우 nil 반환
    unless @user
      render json: { error: "User not found" }, status: :not_found
    end
  end  
end

"""
class UsersController < ApplicationController
  def profile
    @user.update(views: @user.views + 1)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end  
end
"""