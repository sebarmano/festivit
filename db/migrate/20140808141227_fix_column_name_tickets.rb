class FixColumnNameTickets < ActiveRecord::Migration
  def change
    rename_column :tickets, :ticket_types_id, :ticket_type_id
  end
end
