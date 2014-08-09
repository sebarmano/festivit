class AddPickedUpToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :picked_up, :integer, default: 0
  end
end
