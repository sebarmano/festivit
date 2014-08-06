class Participants < ActiveRecord::Migration
  create_table :participants do |t|
    t.string :fname
    t.string :lname
    t.string :street_address
    t.string :city
    t.string :state
    t.string :zip
    t.string :country
    t.string :phone
    t.string :email
    t.string :twitter_link
    t.string :facebook_link

    t.timestamps
  end
end
