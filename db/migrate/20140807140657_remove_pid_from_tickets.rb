class RemovePidFromTickets < ActiveRecord::Migration
  def change
    remove_column :tickets, :participant_id
  end
end
