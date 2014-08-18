# == Schema Information
#
# Table name: fests
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  start_date :datetime
#  end_date   :datetime
#  created_at :datetime
#  updated_at :datetime
#  fest_code  :string(255)
#

class Fest < ActiveRecord::Base
  has_many :submissions, :through => :fest_participant_submissions
  has_many :participants, :through => :fest_participant_submissions
  has_many :role_types, :through => :fest_participant_role_types
  has_many :ticket_types
  has_many :fest_participant_role_types
  has_many :fest_participant_submissions

  # validates :fest_code, :presence => true, :uniqueness => true
  # validates :name, :start_date, presence: true
end
