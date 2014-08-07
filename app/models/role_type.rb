class RoleType < ActiveRecord::Base
  has_many :participants, :through => :fests_participants_role_types
  has_many :fests, :through => :fests_participants_role_types

end