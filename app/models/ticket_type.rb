# == Schema Information
#
# Table name: ticket_types
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  sale_status    :string(255)
#  price          :string(255)
#  sku            :string(255)
#  fest_id        :integer
#  created_at     :datetime
#  updated_at     :datetime
#  productpairsid :string(255)
#

class TicketType < ActiveRecord::Base
  belongs_to :fest
  has_many :tickets

  # validates :name, :presence => true, :uniqueness => true
  # validates :fest_id, :productpairsid, presence: :true
  #
  def to_s
    name
  end
end
