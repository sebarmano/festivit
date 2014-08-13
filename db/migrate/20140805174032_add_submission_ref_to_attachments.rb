class AddSubmissionRefToAttachments < ActiveRecord::Migration
  def change
    add_reference :attachments, :submission, index: true
  end
end
