class UsersController < ApplicationController
  before_action :generate_password, only: :create
  def new
    @user = user_type.new
  end

  def create
    @user = user_type.new(user_params)
    @user.password = @password
    @user.password_confirmation = @password
    @user.save
    @user.send_reset_password_instructions
  end

  private

  def user_params
    params.require(required_user).permit(:email, :password, :password_confirmation, :type)
  end

  def user_type
    params[:type].constantize
  end

  def required_user
    params[:type].downcase.to_sym
  end

  def generate_password
    @password = Devise.friendly_token[0,20]
  end
end
