class Participant < ActiveRecord::Base
  has_one :applicant
  has_many :tickets
  has_many :fests, :through => :fest_participant_role_types
  has_many :role_types, :through => :fest_participant_role_types
  has_many :submissions, :through => :fest_participant_submissions

  accepts_nested_attributes_for :applicant
end
  has_many :submissions, :through => :application_processes
  has_many :fests, :through => :application_processes

  def to_s
    "#{lname}, #{fname}"
  end

  def tickets_count
    tickets.select(ticket_types, count).group(tickets_type)
  end


end
