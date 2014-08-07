class Participant < ActiveRecord::Base
  has_many :orders
  has_many :fests, :through => :fests_participants_role_types
  has_many :role_types, :through => :fests_participants_role_types
  has_many :submissions, :through => :fests_participants_submissions
end