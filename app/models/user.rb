class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable,
         :trackable, :validatable

  include Authority::Abilities
  include Authority::UserAbilities

  def generate_password
    password = Devise.friendly_token[0,20]
    self.password = password
    self.password_confirmation = password
  end

  def registration_token
    set_registration_token
  end

  def admin?
    type == 'Admin'
  end

  protected

  def set_registration_token
    raw, enc = Devise.token_generator.generate(self.class, :reset_password_token)

    self.reset_password_token   = enc
    self.reset_password_sent_at = Time.now.utc
    self.save(validate: false)
    raw
  end
end
