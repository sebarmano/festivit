class ImporterWootix < ActiveImporter::Base
  imports Ticket

  skip_rows_if { row['Item Name'].blank? }

  fetch_model do
    # find or create ticket type
    ticket_type = TicketType.where(
        sku: row['Item SKU']
    ).first_or_initialize

    ticket_type.update!(:name => row['Item Name'],
                        :price => row['Row Price'])

    ticket_type.tickets.where(online_order_id: row['Order ID']).first_or_initialize
  end

  column 'Order ID', :online_order_id
  column 'Date', :date_time
  column 'Order Status', :status
  column 'Item Amount', :qty
  column 'Customer Note', :customer_notes

  on :row_processing do
    # find or create participant
    participant = Participant.where(
        fname: row['Billing First Name'],
        lname: row['Billing Last Name'],
        email: row['Billing Email']
    ).first_or_initialize

    participant.update!(:phone => row['Billing Phone'],
                        :street_address => row['Billing Address 1'],
                        :zip => row['Billing Post code'],
                        :city => row['Billing City'],
                        :state => row['Billing State'],
                        :country => row['Billing Country'])

    model.participant = participant

    # parse sku
    sku_regex = /([A-Z]{3}20\d\d)([A-Z0-9]{3})/
    match = row['Item SKU'].match(sku_regex)
    fest_code = match[1] if match

    # # lookup role_type
    # sku_regex = /([A-Z]{3}20\d\d)([A-Z0-9]{3})/
    # match = row['Item SKU'].match(sku_regex)
    # fest_code = match[1] if match
    #
    #role_type =

    if fest_code
      # find or create fest name
      fest = Fest.where(
        fest_code: fest_code
      ).first_or_initialize

      fest.update!( :name => row['name'],
                    :fest_code => row['fest_code'])

      role_type = RoleType.where(
          role_type: role_type
      ).first_or_initialize

      model.ticket_type.fest = fest
      model.ticket_type.save!

      model.participant.fest_participant_role_type.participant_id = participant
      model.participant.fest_participant_role_type.fest_id = fest
      model.participant.fest_participant_role_type.role_type_id = role_type
            #TODO - make sure role_type #5 is customer in live data

    end
  end

  on :row_error do |ex|
    Rails.logger.error("Did not import: #{ex}")
  end

  on :import_finished do
    Rails.logger.warn("Lines not imported: #{row_errors}") if row_errors.count > 0
  end
end


