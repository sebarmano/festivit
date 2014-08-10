class SubmissionAuthorizer < ApplicationAuthorizer
  def creatable_by?(user)
    user.applicant?
  end
end
