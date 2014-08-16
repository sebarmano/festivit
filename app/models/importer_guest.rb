#will import Google doc guest list
class ImporterGuest < ActiveImporter::Base
  class NoFestError < StandardError; end

  imports Participant

  skip_rows_if { row['fullname'].blank? }

  on :row_processing do
    if row['fullname'].present?
      fullname = row['fullname'].split(',').map(&:strip)
        model.lname = fullname.first
        model.fname = fullname.last
        model.first_or_initialize
        model.email = row['email']
    end

  # find ticket_type_id from column name & pull qty to tuple qty
  tix_columns = ["4day", "Youth", "PorS", "Thu", "Fri", "Sat", "Sun", "PRESS", "Anyday",
                 "TENT", "TENT1", "TENTps", "VHC", "VHC1", "VHCps", "FPKNG", "FPKNGps"]
  tix_columns.each do |tix_column|
    if !row[tix_column].nil?
      #create a ticket
      TicketType.find_by(productpairsid: tix_column, price: 0) #TODO - ck that you can find by 2 items
      model.ticket.ticket_type = ticket_type
      model.ticket.participant = participant
      model.ticket.qty = row[tix_column] #TODO - be sure this pulls the VALUE from tix_column in the row
      model.ticket.online_order_id = row['orderid']
      model.ticket.customer_notes = row['customer_notes']
      model.ticket.status = row['status']
      model.ticket.price = row['price']
      model.ticket.update!
    end
  end

  if row['manual data group'] =
  role_type = RoleType.where(name: 'guest').first_or_initialize
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

#
#TODO - separate roletype based on orderid
#TODO - set orderid upon import from guests vs import from googledoc
#   add line to ignore orderid == blank and orderid == 0
#   orderid_regex = /prev/
#   /^sh/
#   /^guest/
#   /^press/
#   /^sguest/
#   /^w/
# OR, do manualdatagroup regex?


# if tix_columns.upcase.include? column.name #TODO - ck that active_importer calls column names 'name'
#   :ticket_type_id do |name|
#   TicketType.find_by(productpairsid: name)
#   model.ticket_type_id = ticket_type
#   model.qty = row[column.name]
#   model.update!
#
# on :row_processing do
#   # find or create participant
#
#                 end
#   ).first_or_initialize
#
#   participant.update!() #TODO - is update still needed if not actually changing info?
#   model.participant = participant
#
#   fprt = FestParticipantRoleType.where(:participant => participant,
#                                        :fest => model.ticket_type_id.fest,
#                                        :role_type => role_type).first_or_initialize
#   fprt.save!
# end
#