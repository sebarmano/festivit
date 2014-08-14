class FestsController < ApplicationController
  def import
    if request.post?
      uploaded_io = params[:file]
      importer = ImporterFest.new(uploaded_io.tempfile.path, :extension => File.extname(uploaded_io.original_filename))
      importer.import
      redirect_to import_fests_path, notice: "#{importer.row_success_count} fests imported, with #{importer.row_error_count} errors."
    else
      @fests = Fest.all
    end
  end

  private

  def fest_params
    params.require(:fest).permit!
    #TODO - add strong params
  end
end
