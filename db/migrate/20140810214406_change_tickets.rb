class ChangeTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :item_name, :string
  end
end
