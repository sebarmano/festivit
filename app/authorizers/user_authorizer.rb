class UserAuthorizer < ApplicationAuthorizer
  def self.creatable_by?(user)
    user.admin?
  end

  def self.readable_by?(user)
    true
  end
end
