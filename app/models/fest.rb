class Fest < ActiveRecord::Base
  has_many :submissions, :through => :fest_participant_submissions
  has_many :participants, :through => :fest_participant_submissions
  has_many :role_types, :through => :fest_participant_role_types
  has_many :ticket_types
  has_many :fest_participant_role_types
  has_many :fest_participant_submissions

  validate :fest_code, :presence => true, :uniqueness => true

end
