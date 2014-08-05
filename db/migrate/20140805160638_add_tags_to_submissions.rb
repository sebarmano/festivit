class AddTagsToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :tag, :string
  end
end
