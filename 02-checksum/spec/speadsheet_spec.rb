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

  context '5 9 2 8 // 9 4 7 3 // 3 8 6 5' do
    it 'has a divisible sum of 9' do
      sheet = Spreadsheet.new([
        Row.new([5,9,2,8]),
        Row.new([9,4,7,3]),
        Row.new([3,8,6,5]),
      ])
      expect(sheet.divisible_sum).to eq 9
    end
  end
end
