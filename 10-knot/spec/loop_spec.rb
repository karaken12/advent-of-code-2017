require 'loop'
require 'knothash'

RSpec.describe Loop do
  context 'part one' do
    context 'with a small loop' do
      loop_size = 5
      context 'with a length of 3' do
        length = 3
        it 'becomes 2, 1, 0, 3, 4' do
          loop1 = Loop.new(loop_size)
          loop1.reverse(3)
          expect(loop1.elements).to eq [2, 1, 0, 3, 4]
        end
      end

      context 'with lengths of 3, 4' do
        lengths = [3, 4]
        it 'becomes 4, 3, 0, 1, 2' do
          loop1 = Loop.new(loop_size)
          loop1.hash(lengths)
          expect(loop1.elements).to eq [4, 3, 0, 1, 2]
        end
      end

      context 'with lengths of 3, 4, 1' do
        lengths = [3, 4, 1]
        it 'becomes 4, 3, 0, 1, 2' do
          loop1 = Loop.new(loop_size)
          loop1.hash(lengths)
          expect(loop1.elements).to eq [4, 3, 0, 1, 2]
        end
      end

      context 'with lengths of 3, 4, 1, 5' do
        lengths = [3, 4, 1, 5]
        it 'becomes 3, 4, 2, 1, 0' do
          loop1 = Loop.new(loop_size)
          loop1.hash(lengths)
          expect(loop1.elements).to eq [3, 4, 2, 1, 0]
        end
        it 'multiplies to make 12' do
          loop1 = Loop.new(loop_size)
          loop1.hash(lengths)
          expect(loop1.elements[0] * loop1.elements[1]).to eq 12
        end
      end
    end
  end

  context 'part two' do
    context 'translate the text "1,2,3"' do
      text = '1,2,3'
      it 'becomes [49, 44, 50, 44, 51]' do
        lengths = KnotHash.translate(text)
        expect(lengths).to eq [49, 44, 50, 44, 51]
      end
    end
  end
end
