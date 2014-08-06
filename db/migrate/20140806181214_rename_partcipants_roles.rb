class RenamePartcipantsRoles < ActiveRecord::Migration
  def change
    rename_table :participantsroles, :participations
  end
end
