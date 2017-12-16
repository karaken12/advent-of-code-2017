require 'blocks'

RSpec.describe Blocks do
  context 'part one' do
    context 'example stage one' do
      blocks = Blocks.new [0, 2, 7, 0]
      it 'should pick block 3 for restribution' do
        expect(blocks.next_block).to eq 2
      end
      it 'should distribute as expected' do
        blocks.redistribute
        expect(blocks.array).to eq [2, 4, 1, 2]
      end
    end

    context 'example state two' do
      blocks = Blocks.new [2, 4, 1, 2]
      it 'should pick block 2 for redistribution' do
        expect(blocks.next_block).to eq 1
      end
      it 'should distribute as expected' do
        blocks.redistribute
        expect(blocks.array).to eq [3, 1, 2, 3]
      end
    end

    context 'example state three' do
      blocks = Blocks.new [3, 1, 2, 3]
      it 'should pick block 1 for redistribution' do
        expect(blocks.next_block).to eq 0
      end
      it 'should distribute as expected' do
        blocks.redistribute
        expect(blocks.array).to eq [0, 2, 3, 4]
      end
    end

    context 'example state four' do
      blocks = Blocks.new [0, 2, 3, 4]
      it 'should distribute as expected' do
        blocks.redistribute
        expect(blocks.array).to eq [1, 3, 4, 1]
      end
    end

    context 'example state five' do
      blocks = Blocks.new [1, 3, 4, 1]
      it 'should distribute as expected' do
        blocks.redistribute
        expect(blocks.array).to eq [2, 4, 1, 2]
      end
    end

    context 'complete example' do
      blocks = Blocks.new [0, 2, 7, 0]
      it 'cycles after five steps' do
        blocks.detect_cycle
        expect(blocks.step).to eq 5
      end
    end
  end

  context 'part two' do
    blocks = Blocks.new [0, 2, 7, 0]
    it 'has a cycle length of four' do
      blocks.detect_cycle
      expect(blocks.cycle_length).to eq 4
    end
  end
end
