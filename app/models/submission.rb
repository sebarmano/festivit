class Submission < ActiveRecord::Base
  acts_as_taggable
  has_many :attachments
  has_many :photos
  has_many :songs
  has_many :videos

  has_many :fests, :through => :fest_participant_submissions
  has_many :participants, :through => :fest_participant_submissions
  has_many :fest_participant_role_types
  has_many :fest_participant_submissions

  accepts_nested_attributes_for :attachments, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :photos, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :songs, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :videos, :reject_if => :all_blank, :allow_destroy => true
  # accepts_nested_attributes_for :participant

  include Authority::Abilities

  def mail_if_ready
    return nil if complete
    @thing = self.fest_participant_submissions.find_by(submission_id: self.id)
    @participant = Participant.find_by(id: @thing.participant_id)
    SubmissionMailer.init_apply(@participant).deliver
    SubmissionMailer.init_admin(@participant).deliver
  end
end
