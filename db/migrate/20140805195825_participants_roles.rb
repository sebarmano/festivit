class ParticipantsRoles < ActiveRecord::Migration
  create_table :participantsroles do |t|
    t.references :role
    t.references :participant

    t.timestamps
  end
end
