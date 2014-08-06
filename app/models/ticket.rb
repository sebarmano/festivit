class Ticket < ActiveRecord::Base
  belongs_to :ticket_type
  belongs_to :order
end