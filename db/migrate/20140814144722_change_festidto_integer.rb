class ChangeFestidtoInteger < ActiveRecord::Migration
  def change
    remove_column :fest_participant_role_types, :fest_id
    add_column :fest_participant_role_types, :fest_id, :integer
  end
end
