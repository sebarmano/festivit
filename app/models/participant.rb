class Participant < ActiveRecord::Base
  has_one :applicant
  has_many :orders
  has_many :fests, :through => :participations
  has_many :role_types, :through => :participations
  has_many :submissions

  accepts_nested_attributes_for :applicant
end
