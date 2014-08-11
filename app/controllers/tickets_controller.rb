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
    Ticket.import(params[:file])
    redirect_to tickets_path, notice: "Tickets imported."
  end

  def pick_up
    Ticket.update(params[:tickets].keys, params[:tickets].values)
    redirect_to participants_path
  end

  private

  def ticket_params
    params.require(:ticket).permit!
    #TODO - add strong params
  end
end

