class ChangeTickets < ActiveRecord::Migration
  def change
    rename_column :tickets, :ticket_types_id, :ticket_type_id
    add_column :tickets, :item_name, :string
  end
end
