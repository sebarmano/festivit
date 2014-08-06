class ChangeParticipations < ActiveRecord::Migration
  def change
    add_column :participations, :fest_id, :string
  end
end
