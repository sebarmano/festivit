class AddFestcodetoFests < ActiveRecord::Migration
  def change
    add_column :fests, :fest_code, :string
  end
end
