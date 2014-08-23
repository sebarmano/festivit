class UsersController < ApplicationController
  before_action :authenticate_user!
  authorize_actions_for :user_type

  def new
    @user = user_type.new
  end

  def show
    @participant = Applicant.find(params[:id]).participant
    @comment = @participant.comments.new
  end

  def create
    @user = user_type.new(user_params)
    @user.generate_password
    if @user.save
      UserMailer.registration_email(@user).deliver
      redirect_to :root, notice: "#{user_type} was successfully created."
    else
      render :new
    end
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
end
