class FestParticipantRoleType < ActiveRecord::Base
  belongs_to :fest
  belongs_to :role_type
  belongs_to :participant

end