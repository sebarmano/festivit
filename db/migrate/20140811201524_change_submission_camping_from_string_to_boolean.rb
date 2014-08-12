class ChangeSubmissionCampingFromStringToBoolean < ActiveRecord::Migration
  def change
    # change_column :submissions, :camping, :string, :boolean
    # that didnt work
    remove_column :submissions, :camping
    add_column :submissions, :camping, :boolean

  end

end
