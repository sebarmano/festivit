class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :vid_title
      t.string :vid_link
      t.belongs_to :submission, index: true

      t.timestamps
    end
  end
end
