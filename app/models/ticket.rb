# == Schema Information
#
# Table name: tickets
#
#  id              :integer          not null, primary key
#  qty             :string(255)
#  ticket_type_id  :integer
#  created_at      :datetime
#  updated_at      :datetime
#  online_order_id :string(255)
#  date_time       :datetime
#  status          :string(255)
#  participant_id  :integer
#  picked_up       :integer          default(0)
#  customer_notes  :text
#  item_name       :string(255)
#

require 'csv'

class Ticket < ActiveRecord::Base
  belongs_to :ticket_type
  belongs_to :participant

  validates_uniqueness_of :ticket_type_id, :scope => [:online_order_id]
  validates :participant_id, presence: true


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

  def self.search(search)
    if search
      search = search.downcase
      where("lower(customer_notes) LIKE ? OR lower(online_order_id) LIKE ?","%#{search}%", "%#{search}%")
    else
      all
    end
  end
end
