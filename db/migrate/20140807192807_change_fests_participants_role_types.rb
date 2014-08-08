class ChangeFestsParticipantsRoleTypes < ActiveRecord::Migration
  def change
    rename_table :fests_participants_role_types, :fest_participant_role_types
  end
end
