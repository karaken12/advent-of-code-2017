require_relative 'row'
require_relative 'spreadsheet'

class Reader
  def Reader.read_row(row_string)
    array = row_string.split(' ').map { |a| a.to_i }
    Row.new(array)
  end

  def Reader.read_sheet(sheet_string)
    array = sheet_string.lines.map do |row_string|
      Reader.read_row(row_string)
    end
    Spreadsheet.new(array)
  end
end
