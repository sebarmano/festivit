class ParticipantsController < ApplicationController
  def index
    @participants = Participant.includes(:tickets).search(params[:search]).order(:lname, :fname)
    respond_to do |format|
      format.html
      format.pdf do
        pdf = WillCallPdf.new(@participants)
        send_data pdf.render, filename: "Will Call List",
                              type: "application/pdf",
                              disposition: "inline"
      end
    end
  end

  def new
    @participant = Participant.new
    @applicant = @participant.build_applicant
    @role_type = @participant.role_types.new
    # @submission = @participant.submissions.last
  end

  def create
    @participant = Participant.new(participant_params)
    if @participant.save
      sign_in @participant.applicant
      redirect_to new_participant_submission_path(@participant), notice: "Your contact information has been stored."
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

  def guests
    @participants = Participant.guests.order(:lname, :fname)
    render template: 'participants/index'
  end

  def performers
    @participants = Participant.performers.order(:lname, :fname)
    render template: 'participants/index'
  end

  def import_guests
    if request.post?
      uploaded_io = params[:file]
      importer = ImporterGuest.new(uploaded_io.tempfile.path, :extension => File.extname(uploaded_io.original_filename))
      importer.import
      redirect_to import_guests_participants_path, notice: "#{importer.row_success_count} Participants imported, with #{importer.row_error_count} errors."
    else
      @participants = Participant.all
    end
  end

  def import_demoday
    if request.post?
      uploaded_io = params[:file]
      importer = ImporterDemoday.new(uploaded_io.tempfile.path, :extension => File.extname(uploaded_io.original_filename))
      importer.import
      redirect_to import_demoday_participants_path, notice: "#{importer.row_success_count} Participants imported, with #{importer.row_error_count} errors."
    else
      @participants = Participant.all
    end
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
