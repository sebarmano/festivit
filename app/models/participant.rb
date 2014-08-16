class Participant < ActiveRecord::Base
  has_one :applicant
  has_many :tickets
  has_many :fest_participant_submissions
  has_many :fest_participant_role_types
  has_many :fests, :through => :fest_participant_role_types
  has_many :role_types, :through => :fest_participant_role_types
  has_many :submissions, :through => :fest_participant_submissions

  accepts_nested_attributes_for :applicant
  accepts_nested_attributes_for :role_types

  validate :lname, :uniqueness => {scope: [:fname, :email], case_sensitive: false}

  def name
    "#{lname}, #{fname}"
  end

  def tickets_count
    tickets.group(:ticket_type).count
  end

  def import(file)
    ImporterWootix.import(file.path)
  end

  def total_tickets
    tickets.map {|t| t.qty.to_i}.reduce(:+)

  end

  def self.search(search)
    if search
      search = search.capitalize! #TODO fix the capitalization on search
      where("lname LIKE ? OR fname LIKE ?","%#{search}%", "%#{search}%")
    else
      all
    end
  end
  
  #TODO add LIKE in guests to be able to search for it
  scope :customers, -> {includes(:role_types).where("role_types.name = 'customer'").references(:role_types)}
  scope :guests, ->{includes(:role_types).where("role_types.name = 'guest'").references(:role_type)}
  scope :performers, ->{includes(:role_types).where("role_types.name = 'Performer'").references(:role_type)}
end
