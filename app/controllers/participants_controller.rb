class ParticipantsController < ApplicationController
  def index
    @participants = Participant.includes(:tickets).search(params[:search]).order(:lname, :fname)
  end

  def new
    @participant = Participant.new
    @participant.build_applicant
    @participant.role_types.new
    @participant.submissions.new
    # @submission = @participant.submissions.last
  end

  def create
    @participant = Participant.new(participant_params)
    if @participant.save
      sign_in @participant.applicant

      redirect_to new_participant_submission_path(@participant), notice: "You've been successfully signed up"
    else
      render :new, flash: @participant.errors
    end
  end

  def show
    @participant = Participant.find(params[:id])
  end

  def profile
    @participant = Participant.find(params[:participant_id])
    @comment = @participant.comments.new
  end

  def customers
    @participants = Participant.customers.order(:lname, :fname)
    render template: 'participants/index'
  end

  def import
    uploaded_io = params[:file]
    importer = ImporterWootix.new(uploaded_io.tempfile.path, :extension => File.extname(uploaded_io.original_filename))
    importer.import
    redirect_to participants_path, notice: "#{importer.row_success_count} Participants imported, with #{importer.row_error_count} errors."
  else
    @participants = Participant.all
  end

  private

  def participant_params
    params.require(:participant).permit(:fname, :lname, :street_address, :city,
                                 :state, :zip, :country, :phone,
                                 :twitter_link, :facebook_link,
                                 applicant_attributes: [:id, :email,:password,
                                                        :password_confirmation],
                                 role_types_attributes: [:id, :name])
  end


end
