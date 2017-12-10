class Spreadsheet
  attr_reader :checksum

  def initialize(rows)
    @rows = rows
    @checksum = rows.map { |row| row.difference }.sum
  end
end
