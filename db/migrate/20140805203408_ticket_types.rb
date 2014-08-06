class TicketTypes < ActiveRecord::Migration
   create_table :ticket_types do |t|
    t.string :name
    t.string :sale_status
    t.string :price
    t.string :sku
    t.references :fest

    t.timestamps
   end
end
