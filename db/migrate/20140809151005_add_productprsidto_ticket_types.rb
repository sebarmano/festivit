class AddProductprsidtoTicketTypes < ActiveRecord::Migration
  def change
    add_column :tickets, :productpairsid, :string
  end
end
