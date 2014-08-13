class AddNotetoTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :customer_notes, :text
  end
end
