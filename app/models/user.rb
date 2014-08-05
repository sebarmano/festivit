class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable,
         :trackable, :validatable

  def send_registration_email

  end

  def generate_password
    password = Devise.friendly_token[0,20]
    self.password = password
    self.password_confirmation = password
  end
end
