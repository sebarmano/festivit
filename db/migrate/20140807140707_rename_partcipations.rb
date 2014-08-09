class RenamePartcipations < ActiveRecord::Migration
  def change
    rename_table :participations, :fests_participants_role_types
  end
end
