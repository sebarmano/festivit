class AddCompleteToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :complete, :boolean, default: false
  end
end
