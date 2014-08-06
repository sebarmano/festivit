class Tickets < ActiveRecord::Migration
  create_table :tickets do |t|
    t.string :qty
    t.references :ticket_types
    t.references :participant

    t.timestamps
  end
end
