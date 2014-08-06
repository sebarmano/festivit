class Orders < ActiveRecord::Migration
  create_table :orders do |t|
    t.string :online_order_id
    t.string :date_time
    t.string :status
    t.references :participant, :index => true

    t.timestamps
  end
end