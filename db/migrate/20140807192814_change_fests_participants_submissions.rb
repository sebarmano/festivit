class ChangeFestsParticipantsSubmissions < ActiveRecord::Migration
  def change
    rename_table  :fests_participants_submissions, :fest_participant_submissions
  end
end
