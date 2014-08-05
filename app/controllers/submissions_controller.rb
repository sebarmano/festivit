class SubmissionsController < ApplicationController
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
    respond_to do |format|
      if @submission.update(submission_params)
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

  private

  def set_submission
    @submission = Band.find(params[:id])
  end

  def submission_params
      params.require(:submission).permit(:first_name, :last_name, :phone, :email, :bio, :site,
                                        :tag, attachments_attributes: [:id, :title, :link, :file])
  end
end
