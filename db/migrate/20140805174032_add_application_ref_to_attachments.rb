class AddApplicationRefToAttachments < ActiveRecord::Migration
  def change
    add_reference :attachments, :application, index: true
  end
end
