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

  context 'part two' do
    context 'square 1' do
      square = 1
      it 'has value 1' do
        spiral = SpiralMemory.build_sum_spiral_to_square(square)
        expect(spiral.current_value).to eq 1
      end
    end

    context 'square 2' do
      square = 2
      it 'has value 1' do
        spiral = SpiralMemory.build_sum_spiral_to_square(square)
        expect(spiral.current_value).to eq 1
      end
    end

    context 'square 3' do
      square = 3
      it 'has value 2' do
        spiral = SpiralMemory.build_sum_spiral_to_square(square)
        expect(spiral.current_value).to eq 2
      end
    end

    context 'square 4' do
      square = 4
      it 'has value 4' do
        spiral = SpiralMemory.build_sum_spiral_to_square(square)
        expect(spiral.current_value).to eq 4
      end
    end

    context 'square 5' do
      square = 5
      it 'has value 5' do
        spiral = SpiralMemory.build_sum_spiral_to_square(square)
        expect(spiral.current_value).to eq 5
      end
    end

    context 'square 23' do
      square = 23
      it 'has value 806' do
        spiral = SpiralMemory.build_sum_spiral_to_square(square)
        expect(spiral.current_value).to eq 806
      end
    end
  end
end
