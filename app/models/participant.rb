# == Schema Information
#
# Table name: participants
#
#  id             :integer          not null, primary key
#  fname          :string(255)
#  lname          :string(255)
#  street_address :string(255)
#  city           :string(255)
#  state          :string(255)
#  zip            :string(255)
#  country        :string(255)
#  phone          :string(255)
#  email          :string(255)
#  twitter_link   :string(255)
#  facebook_link  :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

class Participant < ActiveRecord::Base
  has_one :applicant
  has_many :tickets
  has_many :fest_participant_submissions
  has_many :fest_participant_role_types
  has_many :fests, :through => :fest_participant_role_types
  has_many :role_types, :through => :fest_participant_role_types
  has_many :submissions, :through => :fest_participant_submissions
  has_many :comments, as: :commentable

  accepts_nested_attributes_for :applicant
  accepts_nested_attributes_for :role_types

  # validates :lname, :fname, presence: true
  # validates :lname, :uniqueness => {scope: [:fname], case_sensitive: false}

  validates :lname, :fname, presence: true

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
      search = search.downcase
      where("lower(lname) LIKE ? OR lower(fname) LIKE ?","%#{search}%", "%#{search}%")
    else
      all
    end
  end

  #TODO add LIKE in guests to be able to search for it
  scope :customers, -> {includes(:role_types).where("role_types.name = 'customer'").references(:role_types)}
  scope :guests, ->{includes(:role_types).where("role_types.name = 'guest'").references(:role_type)}
  scope :performers, ->{includes(:role_types).where("role_types.name = 'performer'").references(:role_type)}
  scope :demoday, ->{includes(:role_types).where("role_types.name = 'demoday'").references(:role_type)}
end
