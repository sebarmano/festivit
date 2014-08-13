class ChangeColumnNameFestParticipantRoleType < ActiveRecord::Migration
  def change
    rename_column :fest_participant_role_types, :role_id, :role_type_id
  end
end
