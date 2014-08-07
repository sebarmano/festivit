class Fest < ActiveRecord::Base
  has_many :submissions, :through => :fest_participant_submissions
  has_many :participants, :through => :fest_participant_role_types
  has_many :role_types, :through => :fest_participant_role_types
  has_many :ticket_types

end