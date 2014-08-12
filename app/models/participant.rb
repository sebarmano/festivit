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

  def self.import(file)
    p = SmarterCSV.process(file.path, {:remove_unmapped_keys => :true,
                                     :key_mapping =>
                                         {
                                             :billing_first_name => :fname,
                                             :billing_last_name => :lname,
                                             # :order_id => :online_order_id,
                                             #   :date => :date_time,
                                             #   :order_status => :status,
                                             #  :shipping => nil,
                                             # :customer_note => :customer_notes,
                                             # :item_sku => nil,
                                             # :item_name => nil,
                                             # :item_amount => nil,
                                             #  :row_price => nil,
                                         }
    }) do |array|
    # we're passing a block in, to process each resulting hash / =row (the block takes array of hashes)
    # when chunking is not enabled, there is only one hash in each array
    p = Participant.create( array.first )
    p.save
    n = SmarterCSV.process(file.path,
                           {:remove_unmapped_keys => :true,
                            :key_mapping =>
                                {:order_id => :online_order_id,
                                 :date => :date_time,
                                 :order_status => :status,
                                 :customer_note => :customer_notes,
                                # pid => :participant_id,
                                }
                           }) do |array|
      # we're passing a block in, to process each resulting hash / =row (the block takes array of hashes)
      # when chunking is not enabled, there is only one hash in each array
    p.create_ticket( array.first ) #.where(participant.fname == :fname)
    t.save
    p.ticket << t
    end
      end
  end

  def name
    "#{lname}, #{fname}"
  end

  def tickets_count
    tickets.group(:ticket_type).count
  end

end
