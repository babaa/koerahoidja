require 'csv'
class PopulateAddresses < ActiveRecord::Migration
  def up
    CSV.foreach('db/addresses.csv', headers: true, header_converters: :symbol, col_sep: ';') do |row|
      next if row[:aadressiliik] == 'aiandusühistu'

      if row[:maakond].presence
        c = County.find_or_create_by(name: row[:maakond] + 'maa')
      end
      c ||= OpenStruct.new

      if row[:vald].presence
        p = Parish.find_or_create_by(name: row[:vald] + ' vald', county_id: c.id)
      end
      p ||= OpenStruct.new

      if row[:linn_alev_alevik_kla].presence
        t = Town.find_or_create_by(name: row[:linn_alev_alevik_kla], county_id: c.id, parish_id: p.id)
      end

    end
  end

  def down
    ActiveRecord::Base.connection.execute("TRUNCATE counties")
    ActiveRecord::Base.connection.execute("TRUNCATE parishes")
    ActiveRecord::Base.connection.execute("TRUNCATE towns")
  end
end
