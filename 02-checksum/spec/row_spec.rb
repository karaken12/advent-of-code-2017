require 'row'

RSpec.describe Row do
  context 'looking for checksums' do
    context '5 1 9 5' do
      row = Row.new([5,1,9,5])
      it 'largest is 9' do
        expect(row.largest).to eq 9
      end
      it 'smallest is 1' do
        expect(row.smallest).to eq 1
      end
      it 'difference is 8' do
        expect(row.difference).to eq 8
      end
    end

    context '7 5 3  ' do
      row = Row.new([7,5,3])
      it 'largest is 7' do
        expect(row.largest).to eq 7
      end
      it 'smallest is 3' do
        expect(row.smallest).to eq 3
      end
      it 'differece is 4' do
        expect(row.difference).to eq 4
      end
    end

    context '2 4 6 8' do
      row = Row.new([2,4,6,8])
      it 'difference is 6' do
        expect(row.difference).to eq 6
      end
    end
  end

  context 'looking for evenly divisible values' do
    context '5 9 2 8' do
      row = Row.new([5,9,2,8])
      it 'divisors are 8, 2' do
        expect(row.divisors).to eq [8,2]
      end
      it 'common division is 4' do
        expect(row.division).to eq 4
      end
    end

    context '9 4 7 3' do
      row = Row.new([9,4,7,3])
      it 'divisors are 9, 3' do
        expect(row.divisors).to eq [9,3]
      end
      it 'common division is 3' do
        expect(row.division).to eq 3
      end
    end

    context '3 8 6 5' do
      row = Row.new([3,8,6,5])
      it 'common division is 2' do
        expect(row.division).to eq 2
      end
    end
  end
end
