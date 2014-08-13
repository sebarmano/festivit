class Fests < ActiveRecord::Migration
  create_table :fests do |t|
    t.datetime :name
    t.datetime :start_date
    t.datetime :end_date

    t.timestamps
  end
end
