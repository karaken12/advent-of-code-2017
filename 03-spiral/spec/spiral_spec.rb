require 'spiral'

RSpec.describe SpiralMemory do
  context 'part one' do
    context 'square 1' do
      square = 1
      it 'has home vector [0,0]' do
        vector = SpiralMemory.home_vector(square)
        expect(vector.x).to eq 0
        expect(vector.y).to eq 0
      end
      it 'has home vector distance 0' do
        vector = SpiralMemory.home_vector(square)
        expect(vector.length).to eq 0
      end
    end

    context 'square 12' do
      square = 12
      it 'has home vector [-2,-1]' do
        vector = SpiralMemory.home_vector(square)
        expect(vector.x).to eq -2
        expect(vector.y).to eq -1
      end
      it 'has home vector distance 3' do
        vector = SpiralMemory.home_vector(square)
        expect(vector.length).to eq 3
      end
    end

    context 'square 23' do
      square = 23
      it 'has home vector [0,2]' do
        vector = SpiralMemory.home_vector(square)
        expect(vector.x).to eq 0
        expect(vector.y).to eq 2
      end
      it 'has home vector distance 2' do
        vector = SpiralMemory.home_vector(square)
        expect(vector.length).to eq 2
      end
    end

    context 'square 1024' do
      square = 1024
      it 'has home vector distance 31' do
        vector = SpiralMemory.home_vector(square)
        expect(vector.length).to eq 31
      end
    end
  end

  context 'temp' do
    context 'square 1' do
      square = 1
      it 'does not move' do
        vector = SpiralMemory.home_vector(square)
        expect(vector.x).to eq 0
        expect(vector.y).to eq 0
      end
    end

    context 'square 9' do
      square = 9
      it 'moves 1 up and 1 to the left' do
        vector = SpiralMemory.home_vector(square)
        expect(vector.x).to eq -1
        expect(vector.y).to eq 1
      end
    end

    context 'square 25' do
      square = 25
      it 'moves 2 up and 2 to the left' do
        vector = SpiralMemory.home_vector(square)
        expect(vector.x).to eq -2
        expect(vector.y).to eq 2
      end
    end

    context 'square 49' do
      square = 49
      it 'moves 3 up and 3 to the left' do
        vector = SpiralMemory.home_vector(square)
        expect(vector.x).to eq -3
        expect(vector.y).to eq 3
      end
    end
  end
end
