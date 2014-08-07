class Fest < ActiveRecord::Base
  has_many :submissions, :through => :fests_participants_submissions
  has_many :participants, :through => :fests_participants_role_types
  has_many :role_types, :through => :fests_participants_role_types
  has_many :ticket_types

end