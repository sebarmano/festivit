# == Schema Information
#
# Table name: fest_participant_role_types
#
#  id             :integer          not null, primary key
#  role_type_id   :integer
#  participant_id :integer
#  created_at     :datetime
#  updated_at     :datetime
#  fest_id        :integer
#

class FestParticipantRoleType < ActiveRecord::Base
  belongs_to :fest
  belongs_to :role_type
  belongs_to :participant

  # validates :role_type_id, :participant_id, :fest_id, presence: :true
end
