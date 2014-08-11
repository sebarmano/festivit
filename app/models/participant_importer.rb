class ParticipantImporter < ActiveImporter::Base
  imports Participant

  skip_rows_if { row['Billing Last Name'].blank? }

  fetch_model do
    Participant.where(
        fname: row['First name'],
        lname: row['Last name'],
        email: row['Billing Email'],
    ).first_or_initialize
  end

  column 'Billing First Name', :fname
  column 'Billing Last Name', :lname
  column 'Billing Phone', :phone
  column 'Billing Address', :street_address
  column 'Billing Post code', :zip
  column 'Billing City', :city
  column 'Billing State', :state
  column 'Billing Country', :country
  column 'Billing Email', :email

  # TODO - add option to participant import for willcall & dreamteam
  # FOR THE WILL CALL IMPORT
  # column('First name', :full_name do |first_name|
  #   last_name = row['Last name']
  #   [first_name, last_name].compact.join(' ')
  # end

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

end


