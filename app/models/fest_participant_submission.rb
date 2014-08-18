# == Schema Information
#
# Table name: fest_participant_submissions
#
#  id             :integer          not null, primary key
#  submission_id  :integer
#  participant_id :integer
#  fest_id        :integer
#  created_at     :datetime
#  updated_at     :datetime
#

class FestParticipantSubmission < ActiveRecord::Base
  belongs_to :fest
  belongs_to :submission
  belongs_to :participant

  # validates :submission_id, :participant_id, :fest_id, presence: :true
end
