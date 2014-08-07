class AddApplicantToParticipant < ActiveRecord::Migration
  def change
      add_reference :users, :participant, index: true
  end
end
