class Participant < ActiveRecord::Base
  has_one :applicant
  has_many :tickets
  has_many :fest_participant_submissions
  has_many :fest_participant_role_types
  has_many :fests, :through => :fest_participant_role_types
  has_many :role_types, :through => :fest_participant_role_types
  has_many :submissions, :through => :fest_participant_submissions

  accepts_nested_attributes_for :applicant


  def name
    "#{lname}, #{fname}"
  end

  def tickets_count
    tickets.group(:ticket_type).count
  end


end
