class UserAuthorizer < ApplicationAuthorizer
  def self.creatable_by?(user)
    user.admin?
  end
end
