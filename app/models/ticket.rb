class Ticket < ActiveRecord::Base
  belongs_to :ticket_type
  validates :online_order_id, :uniqueness => { :scope => :date_time }

  require 'csv'

  #attr_accessor :online_order_id, :date_time
  # TODO - why do accessors make those fields not display in the view?

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |ticket|
        csv << ticket.attributes.values_at(*column_names)
      end
    end
  end

  # def self.import(file)
  #   CSV.foreach(file.path, :headers => :true) do |row|
  #    # byebug
  #    #ticket_attributes = row.to_hash.slice(:online_order_id => row.to_hash["Order ID"], :customer_notes => row.to_hash["Customer Note"])
  #    ticket_attributes = row.to_hash.slice(:online_order_id => row.to_hash["orderid"], :customer_notes => row.to_hash["customer_notes"])
  #    #  online_order_id = row.to_hash["Order ID"]
  #    #  ticket_attributes = { online_order_id: online_order_id}
  #     Ticket.create(ticket_attributes)
  #   end
  # end

  # orders_csv = {
  #   'Order ID' => :online_order_id,
  #     'Date' => :date_time,
  #     'Order Status' => :status,
  #     'Item Amount' => :qty,
  #
  #     'Item Name' => :name,
  #     'Item SKU' => :sku,
  #     'Row Price' => :price,
  #     'Customer Note' => :customer_notes,
  #
  #     'Billing First Name' => :fname,
  #     'Billing Last Name' => :lname,
  #     'Billing Email' => :email,
  #     'Billing Phone' => :phone,
  #     'Billing Address' => :street_address,
  #     'Billing Post code' => :zip,
  #     'Billing City' => :city,
  #     'Billing State' => :state,
  #     'Billing Country' => :country,
  # }
  #
  # willcall_csv = {
  #     'orderid' => :online_order_id,
  #     'Date' => :date_time,
  #     'status' => :status,
  #     'Item Amount' => :qty,
  #
  #     'Item Name' => :name,
  #     'Item SKU' => :sku,
  #     'Row Price' => :price,
  #     'customer_notes' => :customer_notes,
  #
  #     'fullname---' => :fname,
  #     'fullname---' => :lname,
  #
  #     '4day' => ,
  #     'youth' => ,
  #     'pors' => ,
  #
  # }

#--------------------------------------------
  # #THESE WORK
  # def self.import(file)
  #   CSV.foreach(file.path, headers: :true) do |row|
  #     Ticket.create! row.to_hash
  #   end
  # end

  def self.import(file)
    CSV.foreach(file.path, headers: :true) do |row|
      ticket = find_or_create_by(:online_order_id => row["order id"], :date_time => row["date_time"])
      Ticket.create! row.to_hash
    end
  # end
----------------------------------------------

  # def self.import(file)
  #   CSV.foreach(file.path, headers: :true) do |row|
  #     #ticket = find_by_id(row["id"]) || new
  #     Ticket.create! row.to_hash
  #     ticket.attributes = row.to_hash.slice(online_order_id, date_time)
  #     ticket.save!
  #   end
  # end

  # def self.import(file)
  #   CSV.foreach(file.path, headers: :true) do |row|
  #     Ticket.create! row.to_hash
  #     ticket.attributes = row.to_hash.slice(online_order_id, date_time)
  #     ticket.save!
  #   end
  # end

  # def self.import(file)
  #   # spreadsheet = Csv.(file.path, nil, :ignore) => Roo::Csv.new(file.path, nil, :ignore)
  #   # header = spreadsheet.row(1)
  #   # (2..spreadsheet.last_row).each do |i|
  #   CSV.foreach(file.path, headers: :true) do |row|
  #     ticket = find_or_create_by("Order ID", "Item SKU")
  #     ticket.attributes = row.to_hash.slice(
  #         'Order ID' => :online_order_id,
  #         'Date' => :date_time,
  #         'Order Status' => :status,
  #         'Item Amount' => :qty,
  #     ticket_type = find_or_create_by(:name)
  #     ticket_type.attributes = row.to_hash.slice(
  #         'Item Name' => :name,
  #         'Item SKU' => :sku,
  #         'Row Price' => :price,
  #         'Customer Note' => :customer_notes,
  #     participant = find_or_create_by("Order ID", "Item SKU")
  #     participant.attributes = row.to_hash.slice(
  #         'Billing First Name' => :fname,
  #         'Billing Last Name' => :lname,
  #         'Billing Email' => :email,
  #         'Billing Phone' => :phone,
  #         'Billing Address' => :street_address,
  #         'Billing Post code' => :zip,
  #         'Billing City' => :city,
  #         'Billing State' => :state,
  #         'Billing Country' => :country,
  #     )
  #     ticket.save!
  #     participant.save!
  #     ticket_type.save!
  #   end
  # end



 #THIS DOESN'T WORK
 # # def self.import(file)
  #   spreadsheet = open_spreadsheet(file)
  #   header = spreadsheet.row(1)
  #   (2..spreadsheet.last_row).each do |i|
  #     row = Hash[[header, spreadsheet.row(i)].transpose]
  #     ticket = find_by_id(row["id"]) || new
  #     ticket.attributes = row.to_hash.slice(online_order_id, date_time)
  #     ticket.save!
  #   end
  # end
  #
  # def self.open_spreadsheet(file)
  #   case File.extname(file.original_filename)
  #     when ".csv" then Csv.new(file.path, nil, :ignore) => Roo::Csv.new(file.path, nil, :ignore)
  #     when ".xls" then Excel.new(file.path, nil, :ignore) => Roo::Excel.new(file.path, nil, :ignore)
  #     when ".xlsx" Excelx.new(file.path, nil, :ignore) => Roo::Excelx.new(file.path, nil, :ignore)
  #     else raise "Unknown file type: #{file.original_filename}"
  #   end
  # end
#------------------------------------------------
  # def self.import(file)
  #   CSV.foreach(file.path, headers: true) do |row|
  #     ticket_hash = row.to_hash # exclude the price field
  #     ticket = Ticket.where(id: ticket_hash["id"])
  #
  #     if ticket.count == 1
  #       ticket.first.update_attributes(ticket_hash)
  #     else
  #       Ticket.create!(ticket_hash)
  #     end
  #   end
  # end

  # def self.uniquetickets
  #   Ticket.select(:order_id, ).distinct
  # end

  # def self.import(file, category_id)
  #   CSV.foreach(file.path, headers: true) do |row|
  #     ticket_hash = row.to_hash # exclude the price field
  #     ticket = Ticket.where(
  #         :online_order_id => "order id", :name => row[0]
  #     ).first_or_create
  #   end
  # end
end
