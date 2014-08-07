class Participant < ActiveRecord::Base
  has_many :orders
  has_many :fests, :through => :participations
  has_many :role_types, :through => :participations
  has_many :submissions, :through => :application_processes
  has_many :fests, :through => :application_processes

  def to_s
    "#{lname}, #{fname}"
  end

  def tickets_count
    tickets.select(ticket_types, count).group(tickets_type)
  end


end
