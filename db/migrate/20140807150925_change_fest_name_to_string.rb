class ChangeFestNameToString < ActiveRecord::Migration
  def change
    change_column :fests, :name, :string
  end
end
