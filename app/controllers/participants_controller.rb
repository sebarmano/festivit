class ParticipantsController < ApplicationController
  def index
    @participants = Participant.includes(:tickets).all
  end

  def new
    @participant = Participant.new
    @participant.build_applicant
    @participant.role_types.new
    @submission = @participant.submissions.last
  end

  def create
    @participant = Participant.new(participant_params)
    @participant.email = @participant.applicant.email
    if @participant.save
      sign_in @participant.applicant
      redirect_to new_submission_path, notice: "You've been successfully signed up"
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
                                                        :password_confirmation],
                                 role_type_attributes: [:id, :name])
  end

  def make_submission(ptcpnt)
    ptcpnt.submissions.create( complete: false)

  end
end
