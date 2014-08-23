#will import Google doc demo day
class ImporterDemoday < ActiveImporter::Base

  imports Participant

  skip_rows_if { row['fullname'].blank? }

  fetch_model do
    # find or create participant
    @fullname = row['fullname'].split(' ')
    Participant.where(
        lname: @fullname.last,
        fname: @fullname.first
    ).first_or_initialize
  end

  column 'fullname'

  on :row_processing do
    @order_id ||= 0
    @order_id += 1

    # find ticket_type_id from column name & pull qty to tuple qty
    tix_columns = ["4day", "Youth", "PorS", "Thu", "Fri", "Sat", "Sun", "PRESS", "Anyday",
                   "TENT", "TENT1", "TENTps", "VHC", "VHC1", "VHCps", "FPKNG", "FPKNGps",
                   "DTLAN", "DT50","DREAM", "EVENT", "CMPG"]
    tix_columns.each do |tix_column|
      if row[tix_column]
        # create a ticket
        ticket = model.tickets.build(qty: row[tix_column].to_i,
                                     status: row['status'],
                                     online_order_id: "DEMODAY#{@order_id}")
        ticket_type = TicketType.where(productpairsid: tix_column, fest_id: 3841).first_or_initialize #price: '0', fest_id: 3833
        ticket.ticket_type = ticket_type

        #set role_type
        role_type = RoleType.where(name: 'demoday').first_or_create

        # create a fest_participant_role_type
        fprt = model.fest_participant_role_types.build(fest: ticket.ticket_type.fest,
                                                       role_type: role_type)
      end
    end
  end

  on :row_error do |ex|
    Rails.logger.error("Did not import: #{ex}")
  end

  on :import_finished do
    Rails.logger.warn("Lines not imported: #{row_errors}") if row_errors.count > 0
  end
end
