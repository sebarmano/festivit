class Fest < ActiveRecord::Base
  has_many :submissions, :through => :application_processes
  has_many :fests, :through => :application_processes
  has_many :participants, :through => :participations
  has_many :role_types, :through => :participations
  has_many :ticket_types
end