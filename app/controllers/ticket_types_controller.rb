class TicketTypesController < ApplicationController
  def import
    if request.post?
      uploaded_io = params[:file]
      importer = ImporterTicketType.new(uploaded_io.tempfile.path, :extension => File.extname(uploaded_io.original_filename))
      importer.import
      redirect_to import_ticket_types_path, notice: "#{importer.row_success_count} ticket_types imported, with #{importer.row_error_count} errors."
    else
      @ticket_types = TicketType.all
    end
  end
  private

  def ticket_type_params
    params.require(:ticket_type).permit!
    #TODO - add strong params
  end
end