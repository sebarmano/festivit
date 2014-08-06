class Order < ActiveRecord::Base
  belongs_to :participant
  has_many :tickets
end