class Submission < ActiveRecord::Base
  acts_as_taggable
  has_many :attachments

  has_many :fests, :through => :fest_participant_submissions
  has_many :participants, :through => :fest_participant_submissions
  has_many :fest_participant_role_types
  has_many :fest_participant_submissions

  accepts_nested_attributes_for :attachments, :reject_if => :all_blank, :allow_destroy => true
  # accepts_nested_attributes_for :participant

  include Authority::Abilities

  def mail_if_ready
    return nil unless complete
    @participant = self.participants.first
    SubmissionMailer.init_apply(@participant.applicant).deliver
    SubmissionMailer.init_admin(@participant.applicant).deliver
  end
end
