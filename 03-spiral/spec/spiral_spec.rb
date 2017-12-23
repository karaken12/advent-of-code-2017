require 'spiral'

RSpec.describe SpiralMemory do
  context 'part one' do
    context 'square 1' do
      square = 1
      it 'is at vector [0,0]' do
        spiral = SpiralMemory.build_spiral_to(square)
        vector = spiral.current_square
        expect(vector.x).to eq 0
        expect(vector.y).to eq 0
      end
      it 'has home vector distance 0' do
        spiral = SpiralMemory.build_spiral_to(square)
        vector = spiral.current_square
        expect(vector.length).to eq 0
      end
    end

    context 'square 12' do
      square = 12
      it 'is at vector [2,1]' do
        spiral = SpiralMemory.build_spiral_to(square)
        vector = spiral.current_square
        expect(vector.x).to eq 2
        expect(vector.y).to eq 1
      end
      it 'has home vector distance 3' do
        spiral = SpiralMemory.build_spiral_to(square)
        vector = spiral.current_square
        expect(vector.length).to eq 3
      end
    end

    context 'square 23' do
      square = 23
      it 'is at vector [0,-2]' do
        spiral = SpiralMemory.build_spiral_to(square)
        vector = spiral.current_square
        expect(vector.x).to eq 0
        expect(vector.y).to eq -2
      end
      it 'has home vector distance 2' do
        spiral = SpiralMemory.build_spiral_to(square)
        vector = spiral.current_square
        expect(vector.length).to eq 2
      end
    end

    context 'square 1024' do
      square = 1024
      it 'has home vector distance 31' do
        spiral = SpiralMemory.build_spiral_to(square)
        vector = spiral.current_square
        expect(vector.length).to eq 31
      end
    end
  end
end
