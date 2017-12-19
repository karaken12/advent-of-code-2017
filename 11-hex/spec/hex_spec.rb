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
  end
end
