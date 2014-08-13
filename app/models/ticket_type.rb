class TicketType < ActiveRecord::Base
  belongs_to :fest
  has_many :tickets
end