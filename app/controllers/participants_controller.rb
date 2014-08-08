class ParticipantsController < ApplicationController
  def index
    @participants = Participant.all
  end
  def new
    @participant = Participant.new
    @participant.build_applicant
  end

  def create
    @participant = Participant.new(participant_params)
    @participant.email = @participant.applicant.email
    if @participant.save
      make_submission(@participant)
      redirect_to @participant, notice: "You've been successfully signed up"
    else
      render :new, flash: @participant.errors
    end
  end

  def show
    @participant = Participant.find(params[:id])
    @submission = @participant.submissions.last
  end

  private

  def participant_params
    params.require(:participant).permit(:fname, :lname, :street_address, :city,
                                 :state, :zip, :country, :phone, :email,
                                 :twitter_link, :facebook_link,
                                 applicant_attributes: [:id, :email,:password,
                                                        :password_confirmation])
  end

  def make_submission(ptcpnt)
    ptcpnt.submissions.create(first_name: ptcpnt.fname, last_name: ptcpnt.lname,
                      phone: ptcpnt.phone, email: ptcpnt.email, complete: false)

  end
end
