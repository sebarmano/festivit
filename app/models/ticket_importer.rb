class TicketImporter < ActiveImporter::Base
  imports Ticket

  skip_rows_if { row['Item Name'].blank? }

  fetch_model do
    Ticket.where(
        online_order_id: row['Order ID'],
        item_name: row['Item Name'],
    ).first_or_initialize
  end

  column 'Order ID', :online_order_id
  column 'Date', :date_time
  column 'Order Status', :status
  column 'Item Amount', :qty
  column 'Item Name', :item_name
  column 'Item SKU', :ticket_type_id do |sku|
    Ticket_type.find_by(name: sku)
  end

  column 'Billing Last Name', :participant_id do |lname, fname|
    Participant.find_by(name: lname, fname)
  end

  on :import_failed do |ex|
    some_logger.error("Could not start importing data: #{ex}")
  end

  on :row_error do |ex|
    some_logger.error("Could not start importing data: #{ex}")
    @rows_with_errors += 1
  end

  on :row_success do
    @rows_imported += 1
  end

  on :row_processed do
    @rows_processed += 1
  end

  #TRYING TO GET PID FOR CURRENT PARTICIPANT------------

  # column 'Billing Last Name', :participant_id do |sku|
  #   Participant.find_by(name: sku)
  # end
  #
  # on :row_processing do
  #   if row['Billing Last Name'].present?
  #     tags = row['Tags'].split(',').map(&:strip).map(&:downcase)
  #     model.participant_id = !!tags.delete('manager')
  #     model.tag_ids = tags.map { |tag| Tag.where(name: tag).first_or_create }
  #   end
  # end
  #
  # def find_participant do
  #   fetch_model do
  #     Participant.where(
  #         fname: row['First name'],
  #         lname: row['Last name'],
  #         email: row['Billing Email'],
  #     ).first_or_initialize.id #pull participant ID
  #   end
  # end
end