class AddSongToAttachments < ActiveRecord::Migration
  def change
    add_column :attachments, :song_uid, :string
  end
end
