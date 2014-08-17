class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  def author
    return if user_id.nil?
    User.find(user_id).email
  end
end
