class SubmissionsController < ApplicationController
  before_action :set_submission, only: [:show, :edit, :update, :destroy, :approve, :decline]
  before_action :authenticate_user!
  # authorize_actions_for :user_type

  def index
    @submissions = Submission.search(params[:search])
  end

  def show
    @participant = Participant.find(params[:participant_id])
    # TODO: need to fix all the blah.first
    @submission = @participant.submissions.first
    @role = @participant.role_types.first.name
    @comment = @submission.comments.new
  end

  def new
    @participant = Participant.find(params[:participant_id])
    @submission = @participant.submissions.new
    @role = @participant.role_types.first.name
    @types = ['song', 'video', 'photo']
    authorize_action_for(@submission)
  end

  def edit
    @participant = Participant.find(params[:participant_id])
  end

  def create
    @participant = Participant.find(params[:participant_id])
    @submission = Submission.new(submission_params)
    authorize_action_for(@submission)

    respond_to do |format|
      if @submission.save
        @participant.fest_participant_submissions.create(:submission_id => @submission.id)
        @submission.mail_if_ready
        format.html {redirect_to participant_submission_path(@participant,@submission), notice: 'Your application was created!'}
        format.json { render :show, status: :created, location: @submission }
      else
        format.html {render :new}
        format.json { render json: @submission.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    @participant = Participant.find(params[:participant_id])
    @role = @participant.role_types.first # TODO: allow for multi role sign up
    respond_to do |format|
      if @submission.update(submission_params)
        @submission.mail_if_ready
        format.html { redirect_to participant_submission_path(@participant,@submission), notice: 'Your application was updated!'}
        format.json { render :show, status: :created, location: @submission }
      else
        format.html {render :new}
        format.json { render json: @submission.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @submission.destroy
    respond_to do |format|
      format.html { redirect_to submissions_url, notice: 'Your application has been destroyed.'}
      format.json { head :no_content}
    end
  end

  def approve
    @submission.approve = true
    @submission.save
    @thing = @submission.fest_participant_submissions.find_by(submission_id: @submission.id)
    @participant = Participant.find_by(id: @thing.participant_id)
    SubmissionMailer.approved(@participant).deliver
    redirect_to submissions_path
  end

  def decline
    @submission.approve = false
    @submission.save
    @thing = @submission.fest_participant_submissions.find_by(submission_id: @submission.id)
    @participant = Participant.find_by(id: @thing.participant_id)
    SubmissionMailer.decline(@participant).deliver
    redirect_to submissions_path
  end
  private

  def set_submission
    @submission = Submission.find(params[:id])
  end

  def submission_params
      params.require(:submission).permit(:bio, :website, :complete, :group_name, :craft_desc, :photo_desc,
                                         :booth_desc, :practice_type, :practice_lic_no, :electrical,
                                         :practice_exp_date, :practice_years, :underage, :ticket_req, :days_avail,
                                         :deposit_type, :returning, :crew_hist, :crew_pref, :comments, :shit_pref,
                                         :why_volunteer, :mission_statement, :handouts, :_destroy, :participant_id,
                                         :camping, :tag_list,:facebook_link,:twitter_link,
                                         attachments_attributes: [:id, :title, :link, :image, :type, :song] )
  end
end
