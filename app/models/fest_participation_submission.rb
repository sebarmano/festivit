class FestParticipantSubmission < ActiveRecord::Base
  belongs_to :fest
  belongs_to :submission
  belongs_to :participant

end