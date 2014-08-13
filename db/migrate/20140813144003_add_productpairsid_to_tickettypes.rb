class AddProductpairsidToTickettypes < ActiveRecord::Migration
  def change
    remove_column :tickets, :productpairsid, :string
    add_column :ticket_types, :productpairsid, :string
  end
end
