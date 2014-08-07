class RoleType < ActiveRecord::Base
  has_many :participants, :through => :fest_participant_role_types
  has_many :fests, :through => :fest_participant_role_types

end