class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.text :bio
      t.string :site

      t.timestamps
    end
  end
end
