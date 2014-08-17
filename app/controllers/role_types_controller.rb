class RoleTypesController < ApplicationController
  def import
    if request.post?
      uploaded_io = params[:file]
      importer = ImporterRoleType.new(uploaded_io.tempfile.path, :extension => File.extname(uploaded_io.original_filename))
      importer.import
      redirect_to import_role_types_path, notice: "#{importer.row_success_count} role_types imported, with #{importer.row_error_count} errors."
    else
      @role_types = RoleType.all
    end
  end
  private

  def role_type_params
    params.require(:role_type).permit!
    #TODO - add strong params
  end
end