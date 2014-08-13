class AddElectricalToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :electrical, :string
  end
end
