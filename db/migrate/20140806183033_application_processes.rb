class ApplicationProcesses < ActiveRecord::Migration
  create_table :application_processes do |t|
    t.references :submission
    t.references :participant
    t.references :fest

    t.timestamps
  end
end
