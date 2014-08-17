class RemoveSongsVideosPhotos < ActiveRecord::Migration
  def change
    drop_table :songs
    drop_table :videos
    drop_table :photos
  end
end
