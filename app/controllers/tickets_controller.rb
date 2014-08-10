class TicketsController < ApplicationController

  def pick_up 
    Ticket.update(params[:tickets].keys, params[:tickets].values)
    redirect_to participants_path
  end
end
