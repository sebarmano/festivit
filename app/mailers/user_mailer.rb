class UserMailer < Devise::Mailer
  include Devise::Controllers::UrlHelpers

  default :from => "festiviteam@gmail.com"

  def registration_email(user)
    @user = user
    @token = @user.registration_token
    mail(to: @user.email, subject: 'Welcome to Festivit')
  end
end
