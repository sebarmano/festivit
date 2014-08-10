class AddColumnToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :group_name, :string
    add_column :submissions, :facebook_link, :string
    add_column :submissions, :twitter_link, :string
    add_column :submissions, :craft_desc, :text
    add_column :submissions, :photo_desc, :text
    add_column :submissions, :booth_desc, :text
    add_column :submissions, :camping, :string
    add_column :submissions, :practice_type, :string
    add_column :submissions, :practice_lic_no, :string
    add_column :submissions, :practice_exp_date, :string
    add_column :submissions, :practice_years, :string
    add_column :submissions, :underage, :boolean
    add_column :submissions, :ticket_req, :string
    add_column :submissions, :days_avail, :string
    add_column :submissions, :deposit_type, :string
    add_column :submissions, :returning, :boolean
    add_column :submissions, :crew_hist, :text
    add_column :submissions, :crew_pref, :string
    add_column :submissions, :comments, :text
    add_column :submissions, :shift_pref, :string
    add_column :submissions, :why_volunteer, :text
    add_column :submissions, :mission_statement, :text
    add_column :submissions, :handouts, :text
    rename_column :submissions, :site, :website
    remove_column :submissions, :first_name
    remove_column :submissions, :last_name
    remove_column :submissions, :phone
    remove_column :submissions, :email
  end
end
