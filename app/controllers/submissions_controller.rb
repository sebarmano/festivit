class SubmissionsController < ApplicationController
  before_action :set_submission, only: [:show, :edit, :update, :destroy, :approve]
  before_action :authenticate_user!
  # authorize_actions_for :user_type

  def index
    @submissions = Submission.all


  end

  def show
    @participant = @submission.participants.first
  end

  def new

    @submission = Submission.new
    authorize_action_for(@submission)

  end

  def edit

  end

  def create
    @submission = Submission.new(submission_params)
    authorize_action_for(@submission)
    @submission.mail_if_ready
    respond_to do |format|
      if @submission.save
        format.html {redirect_to @submission, notice: 'Your application was created!'}
        format.json { render :show, status: :created, location: @submission }
      else
        format.html {render :new}
        format.json { render json: @submission.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    participant = @submission.participants.first
    @role = participant.role_types.first # TODO: allow for multi role sign up
    respond_to do |format|
      if @submission.update(submission_params)
        @submission.mail_if_ready
        format.html { redirect_to @submission, notice: 'Your application was updated!'}
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
    SubmissionMailer.approved(@submission).deliver
    redirect_to :root
  end

  private

  def set_submission
    @submission = Submission.find(params[:id])
  end

  def submission_params
      params.require(:submission).permit( :bio, :website, :tag, :first_name, :last_name, :phone, :email, :complete,
                                            attachments_attributes: [:id, :title, :link, :image])
  end
end
