require 'pipes'

RSpec.describe Pipes do
  context 'part one' do
    sample_input = (
      '0 <-> 2
      1 <-> 1
      2 <-> 0, 3, 4
      3 <-> 2, 4
      4 <-> 2, 3, 6
      5 <-> 6
      6 <-> 4, 5'
    )
    context 'the sample input' do
      it 'has five programs connected to 0' do
        pipes = Pipes.parse(sample_input)
        expect(pipes.group_size).to eq 5
      end
    end
  end
end
