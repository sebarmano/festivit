class SubmissionAuthorizer < ApplicationAuthorizer
  def creatable_by?(user)
    user.applicant? || user.admin?
  end
end
