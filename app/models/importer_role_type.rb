class ImporterRoleType < ActiveImporter::Base
  imports RoleType

  skip_rows_if { row['name'].blank? }

  fetch_model do
    # find or create role type
    role_type = RoleType.where(
        name: row['name']
    ).first_or_initialize
  end

  on :row_error do |ex|
    Rails.logger.error("Did not import: #{ex}")
  end

  on :import_finished do
    Rails.logger.warn("Lines not imported: #{row_errors}") if row_errors.count > 0
  end
end