class RenameApplicationProcesses < ActiveRecord::Migration
  def change
   rename_table :application_processes, :fests_participants_submissions
  end
end
