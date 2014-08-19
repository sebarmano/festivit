class TicketsController < ApplicationController
  def index
    @tickets = Ticket.order(:date_time => :desc)
    respond_to do |format|
      format.html
      #format.csv { send_data @tickets.to_csv }
      #format.xls # { send_data @tickets.to_csv(col_sep: "\t") }
      #format.xls # { send_data @tickets.to_csv(col_sep: "\t") }
    end
  end

  def show

  end

  def edit

  end

  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to tickets_url, notice: 'Your ticket has been deleted.'}
      format.json { head :no_content}
    end
  end

  def import
    if request.post?
      uploaded_io = params[:file]
      importer = ImporterWootix.new(uploaded_io.tempfile.path, :extension => File.extname(uploaded_io.original_filename))
      importer.import
      redirect_to import_tickets_path, notice: "#{importer.row_success_count} tickets imported, with #{importer.row_error_count} errors."
    else
      @tickets = Ticket.all
    end
  end

  def pick_up
    Ticket.update(params[:tickets].keys, params[:tickets].values)
    redirect_to participants_path, notice: "Picked up tickets saved"
  end

  private

  def ticket_params
    params.require(:ticket).permit!
    #TODO - add strong params
  end
end
