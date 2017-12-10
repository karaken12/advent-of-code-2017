class Spreadsheet
  attr_reader :rows

  def initialize(rows)
    @rows = rows
  end

  def checksum
    rows.map { |row| row.difference }.sum
  end

  def divisible_sum
    rows.map { |row| row.division }.sum
  end
end
