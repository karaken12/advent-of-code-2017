require 'reader'

RSpec.describe Reader do
  context 'with 1 2 3' do
    it 'should create a row' do
      row = Reader.read_row('1 2 3')
      expect(row.data).to eq [1,2,3]
    end
  end

  context 'with 1 2 3  ' do
    it 'should create a row with three elements' do
      row = Reader.read_row('1 2 3  ')
      expect(row.data).to eq [1,2,3]
    end
  end

  context 'with 1 2 3 // 4 5 6' do
    it 'should create two rows' do
      sheet = Reader.read_sheet("1 2 3\n4 5 6")
      expect(sheet.rows[0].data).to eq [1,2,3]
      expect(sheet.rows[1].data).to eq [4,5,6]
    end
  end

  context 'with 5 1 9 5 // 7 5 3   // 2 4 6 8' do
    it 'should have checksum 18' do
      sheet = Reader.read_sheet("5 1 9 5\n7 5 3  \n2 4 6 8")
      expect(sheet.checksum).to eq 18
    end
  end
end
