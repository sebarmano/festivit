#will import Google doc guest list
class ImporterGuest < ActiveImporter::Base
  class NoFestError < StandardError;
  end

  imports Participant

  skip_rows_if { row['fullname'].blank? }

  fetch_model do
    # find or create participant
    @fullname = row['fullname'].split(',').map(&:strip) #TODO - deal w first few junk rows
    @participant = Participant.where(
        lname: @fullname.first,
        fname: @fullname.last
    ).find_or_initialize
  end

  column 'email', :email
  on :row_processing do
    # find ticket_type_id from column name & pull qty to tuple qty
    tix_columns = ["4day", "Youth", "PorS", "Thu", "Fri", "Sat", "Sun", "PRESS", "Anyday",
                   "TENT", "TENT1", "TENTps", "VHC", "VHC1", "VHCps", "FPKNG", "FPKNGps",
                   "DTLAN", "DT50","DREAM"]
    tix_columns.each do |tix_column|
      if row[tix_column]
        # create a ticket
        ticket = model.tickets.build(qty: row[tix_column],
                                     online_order_id: (row['orderid']).to_s,
                                     customer_notes: row['customer_notes'],
                                     status: row['status'])
        ticket_type = TicketType.where(productpairsid: tix_column, price: '0').first
        ticket.ticket_type = ticket_type
        ticket.save!
        # set role_type
        if row['manual data group'] == 'phone'
          role_type = RoleType.where(name: 'customer').first_or_initialize
        else
          role_type = RoleType.where(name: 'guest').first_or_initialize
        end
        # create a fest_participant_role_type
        fprt = FestParticipantRoleType.where(:participant => @participant,
                                             :fest => ticket.ticket_type.fest,
                                             :role_type => role_type).first_or_initialize
        fprt.save!
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
#
#TODO - separate roletype based on orderid
#TODO - set orderid upon import from guests vs all imported from googledoc are same
#   add line to ignore orderid == blank and orderid == 0
#   orderid_regex = /prev/
#   /^sh/
#   /^guest/
#   /^press/
#   /^sguest/
#   /^w/
# OR, do manualdatagroup regex?
