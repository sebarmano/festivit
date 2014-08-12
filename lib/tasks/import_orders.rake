

#
# CSV.foreach('filepath of my csv', :headers => true, :encoding => 'ISO-8859-1:UTF-8') do |row|
#   Order.create(row.to_hash.slice('online id' rating year country state_or_province))
# end

namespace :import do
  desc "Import ticket data"
  task ticket: :environment do
    require 'csv'

    headers = [
      "online_order_id",
      "date_time",
    ]

    ActiveRecord::Base.establish_connection

    CSV.foreach("#{lib}/orders_test_abbr.csv", {headers: :first_row}) do |row|
      sql_keys = []
      sql_vals = []

      created_at = Time.now.strftime("%Y-%m-%d %H:%M:%S")

      headers.each_with_index do |key, idx|
        val = row[idx]

        sql_keys << key
        sql_vals << ActiveRecord::Base.connection.quote(val)
      end

      sql = "
        INSERT INTO bars (#{sql_keys.join(', ')}, created_at, updated_at)
        VALUES (#{sql_vals.join(', ')}, '#{created_at}', '#{created_at}')
"

      res = ActiveRecord::Base.connection.execute(sql)
      ticket_id = ActiveRecord::Base.connection.last_inserted_id(res)

      # do some cool stuff, like create records in other tables that reference bar_id
      # use ActiveRecord::Base.connection.execute(your_sql) in subsequent calls.
      # no need to close the connection, or reopen it before calling execute.
    end
  end
end