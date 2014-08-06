class RoleType < ActiveRecord::Base
  has_many :participants, :through => :participations
  has_many :fests, :through => :participations

end