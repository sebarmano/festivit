class EditTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :online_order_id, :string
    add_column :tickets, :date_time, :datetime
    add_column :tickets, :status, :string
    add_reference :tickets, :participant, :index => true

  end
end
