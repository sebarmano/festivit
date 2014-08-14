class ImporterTicketType < ActiveImporter::Base
  imports TicketType

  skip_rows_if { row['name'].blank? }

  fetch_model do
    # find or create ticket type
    fest = TicketType.where(
        sku: row['sku']
    ).first_or_initialize
  end

  column 'name', :name
  column 'sale_status', :sale_status
  column 'price', :price
  #column 'sku', :sku
  #column 'fest_id', :fest_id
  column 'productpairsid', :productpairsid

  on :row_processing do
    # parse name
    # tt_regex = /(\w+\s*\w*)(?=(\sCamping:)|(\sParking:)|(\sTickets:))/
    # match = row['name'].match(tt_regex)
    # fest_name = match[1] if match

    # parse sku
    fest_regex = /^(\w{7})(.*)/
    match = row['Item SKU'].match(fest_regex)
    fest_code = match[1] if match

    if fest_code
      fest = Fest.where(
          fest_code: fest_code
      ).first_or_initialize

      model.fest_id = fest
      model.save!
    end
  end
end