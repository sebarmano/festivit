class AddSubmissionsToParticipant < ActiveRecord::Migration
  def change
    add_reference :submissions, :participant, index: true
  end
end
