class Participant < ActiveRecord::Base
  has_many :orders
  has_many :fests, :through => :participations
  has_many :role_types, :through => :participations
  has_many :submissions, :through => :application_processes
  has_many :fests, :through => :application_processes
end