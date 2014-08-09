class TicketsController < ApplicationController

  def pick_up 
    # TODO edit all picked up tickets
    redirect_to participants_path
  end
end
