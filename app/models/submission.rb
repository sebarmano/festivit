class Submission < ActiveRecord::Base
  acts_as_taggable
  has_many :attachments
  has_many :fests
  belongs_to :participant

  accepts_nested_attributes_for :attachments, :reject_if => :all_blank, :allow_destroy => true

  def mail_if_ready
    return nil unless complete
    SubmissionMailer.init_apply(self).deliver
    SubmissionMailer.init_admin(self).deliver
  end
end
