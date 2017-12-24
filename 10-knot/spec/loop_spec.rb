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

    context 'construct dense hash' do
      sparse_hash = [65, 27, 9, 1, 4, 3, 40, 50, 91, 7, 6, 0, 2, 5, 68, 22]
      it 'has a dense hash of 64' do
        dense_hash = KnotHash.dense_hash(sparse_hash)
        expect(dense_hash).to eq [64]
      end
    end

    context 'with text ""' do
      text = ''
      it 'hashes to a2582a3a0e66e6e86e3812dcb672a272' do
        hash = KnotHash.hash(text)
        expect(hash).to eq 'a2582a3a0e66e6e86e3812dcb672a272'
      end
    end

    context 'with text "AoC 2017"' do
      text = 'AoC 2017'
      it 'hashes to 33efeb34ea91902bb2f59c9920caa6cd' do
        hash = KnotHash.hash(text)
        expect(hash).to eq '33efeb34ea91902bb2f59c9920caa6cd'
      end
    end

    context 'with text "1,2,3"' do
      text = '1,2,3'
      it 'hashes to 3efbe78a8d82f29979031a4aa0b16a9d' do
        hash = KnotHash.hash(text)
        expect(hash).to eq '3efbe78a8d82f29979031a4aa0b16a9d'
      end
    end

    context 'with text "1,2,4"' do
      text = '1,2,4'
      it 'hashes to 63960835bcdc130f0b66d7ff4f6a5a8e' do
        hash = KnotHash.hash(text)
        expect(hash).to eq '63960835bcdc130f0b66d7ff4f6a5a8e'
      end
    end
  end
end
