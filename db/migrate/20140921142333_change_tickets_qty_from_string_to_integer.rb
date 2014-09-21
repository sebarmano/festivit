class ChangeTicketsQtyFromStringToInteger < ActiveRecord::Migration
  def change
    change_column :tickets, :qty, 'integer USING CAST(qty AS integer)'
  end
end
