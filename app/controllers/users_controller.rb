class UsersController < ApplicationController
  def new
    @user = user_type.new
  end

  def create
    @user = user_type.new(user_params)
    @user.save
  end

  private

  def user_params
    params.require(require_user).permit(:email, :password, :password_confirmation, :type)
  end

  def user_type
    params[:type].constantize
  end

  def require_user
    params[:type].downcase.to_sym
  end
end
