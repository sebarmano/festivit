require 'csv'

class Ticket < ActiveRecord::Base
  belongs_to :ticket_type
  belongs_to :participant

  #validates_uniqueness_of :ticket_type_id, :scope => [:online_order_id]

  def remaining
    qty.to_i - picked_up.to_i
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |ticket|
        csv << ticket.attributes.values_at(*column_names)
      end
    end
  end
end
