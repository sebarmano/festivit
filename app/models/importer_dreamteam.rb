# # TODO - add option to participant import view for willcall & dreamteam

#will import Google doc dreamteam list
class ImporterDreamteam < ActiveImporter::Base
  class NoFestError < StandardError; end

    imports Participant

    skip_rows_if { row['lname'].blank? }

    fetch_model do
      # find or create participant
      participant = Participant.where(
          lname: row['lastname'],
          fname: row['firstname']
      ).first_or_initialize
    end

    column 'Email', :email
    column 'Address', :street_address
    column 'City', :city
    column 'State', :state
    column 'Zip', :zip
    column 'Phone', :phone
    #
    on :row_processing do

      tix_columns = ["4day", "Youth", "PorS", "Thu", "Fri", "Sat", "Sun", "PRESS", "Anyday",
                     "TENT", "TENT1", "TENTps", "VHC", "VHC1", "VHCps", "FPKNG", "FPKNGps",
                    "DTLAN", "DT50","DREAM"]
      tix_columns.each do |tix_column|
        if row[tix_column]
          #create a ticket
          ticket = model.tickets.build(qty: row[tix_column],
                                       online_order_id: (row['OrderID']).to_s,
                                       customer_notes: row['customer_notes'],
                                       date_time: row['Date'],
                                       status: row['status'])
          ticket_type = TicketType.where(productpairsid: tix_column, price: '0').first
          ticket.ticket_type = ticket_type
          ticket.save!
        end
      end


        role_type = RoleType.where(name: 'customer').first_or_initialize
        fprt = FestParticipantRoleType.where(:participant => participant,
                                             :fest => model.ticket_type.fest,
                                             :role_type => role_type).first_or_initialize
        fprt.save!

    on :row_error do |ex|
      Rails.logger.error("Did not import: #{ex}")
    end

    on :import_finished do
      Rails.logger.warn("Lines not imported: #{row_errors}") if row_errors.count > 0
    end
  end