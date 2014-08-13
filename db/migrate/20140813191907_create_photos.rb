class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :photo_desc
      t.string :image_uid
      t.belongs_to :submission, index: true

      t.timestamps
    end
  end
end
