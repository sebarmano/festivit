class TicketType < ActiveRecord::Base
  belongs_to :fest
  has_many :tickets

  validate :name, :presence => true, :uniqueness => true
end
