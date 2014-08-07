class SubmissionsController < ApplicationController
  before_action :set_submission, only: [:show, :edit, :update, :destroy, :approve]
  def index
    @submissions = Submission.all
  end

  def show

  end

  def new
    @submission = Submission.new
  end

  def edit

  end

  def create
    @submission = Submission.new(submission_params)
    @admin = Admin.first
    SubmissionMailer.init_apply(@submission).deliver

    respond_to do |format|
      if @submission.save
        SubmissionMailer.init_admin(@submission).deliver
        format.html {redirect_to @submission, notice: 'Your application was created!'}
        format.json { render :show, status: :created, location: @submission }
      else
        format.html {render :new}
        format.json { render json: @submission.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    respond_to do |format|
      if @submission.update(submission_params)
        format.html { redirect_to @submission.particpant, notice: 'Your application was updated!'}
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


  end

  private

  def set_submission
    @submission = Submission.find(params[:id])
  end

  def submission_params
<<<<<<< HEAD
      params.require(:submission).permit( :bio, :site, :tag, :first_name, :last_name, :phone, :email,
                                            attachments_attributes: [:id, :title, :link, :image])
=======
      params.require(:submission).permit(:first_name, :last_name,:phone,:email, :bio, :site, :tag, attachments_attributes: [:id, :title, :link, :image],
                                        participants_attributes: [:id, :first_name, :last_name, :phone, :email])
>>>>>>> upstream/release-1
  end
end
