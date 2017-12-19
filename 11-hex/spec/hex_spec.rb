require 'hex'

RSpec.describe Hex do
  context 'part one' do
    context 'ne,ne,ne' do
      steps = 'ne,ne,ne'
      it 'is three steps away' do
        path = Hex.parse(steps)
        result = path.simplify
        expect(result.size).to eq 3
      end
    end

    context 'ne,ne,sw,sw' do
      steps = 'ne,ne,sw,sw'
      it 'is 0 steps away' do
        path = Hex.parse(steps)
        result = path.simplify
        expect(result.size).to eq 0
      end
    end

    context 'ne,ne,s,s' do
      steps = 'ne,ne,s,s'
      it 'is 2 steps away' do
        path = Hex.parse(steps)
        result = path.simplify
        expect(result.size).to eq 2
      end
    end
  end
end
