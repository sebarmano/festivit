class ImporterFest < ActiveImporter::Base
  imports Fest

  skip_rows_if { row['name'].blank? }

  fetch_model do
    # find or create fest
    fest = Fest.where(
        name: row['name']
    ).first_or_initialize
  end

  column 'fest_code', :fest_code

end

