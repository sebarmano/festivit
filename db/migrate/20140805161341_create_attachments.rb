class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :title
      t.string :link
      t.string :image_uid

      t.timestamps
    end
  end
end
