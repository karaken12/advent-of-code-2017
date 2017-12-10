require 'spreadsheet'

RSpec.describe Spreadsheet do
  context '5 1 9 5 // 7 5 3   // 2 4 6 8' do
    it 'has a checksum of 18' do
      sheet = Spreadsheet.new([
        Row.new([5,1,9,5]),
        Row.new([7,5,3]),
        Row.new([2,4,6,8]),
      ])
      expect(sheet.checksum).to eq 18
    end
  end
end
