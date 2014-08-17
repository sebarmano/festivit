class CommentsController < ApplicationController

  def create
    @participant = Participant.find(params[:participant_id])
    unless params[:submission_id].nil?
      @submission = Submission.find(params[:submission_id])
      @comment = @submission.comments.new(comment_params)
    else
      @comment = @participant.comments.new(comment_params)
    end
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        if @submission
          format.html { redirect_to participant_submission_path(@participant, @submission), notice: 'Comment was successfully created.' }
        else
          format.html { redirect_to participant_profile_path(@participant), notice: 'Comment was successfully created.' }
        end
      else
        format.html { render :new }
      end
    end
  end

  def update
    @participant = Participant.find(params[:participant_id])
    @submission = Submission.find(params[:submission_id])
    @comment = @submission.comments.new(comment_params)

    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to participant_submission_path(@participant, @submission), notice: 'Comment was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:user_id, :body, :commentable_id, :commentable_type)
    end
end
