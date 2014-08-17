# == Schema Information
#
# Table name: role_types
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class RoleType < ActiveRecord::Base
  has_many :participants, :through => :fest_participant_role_types
  has_many :fests, :through => :fest_participant_role_types
  has_many :fest_participant_role_types
  has_many :fest_participant_submissions

  validate :name, :presence => true, :uniqueness => true
end
