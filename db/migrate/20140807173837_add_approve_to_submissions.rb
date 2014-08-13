class AddApproveToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :approve, :boolean
  end
end
