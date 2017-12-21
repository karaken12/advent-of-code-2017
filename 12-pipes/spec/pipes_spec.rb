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
      it 'has six programs in the group containing 0' do
        pipes = Pipes.parse(sample_input)
        expect(pipes.group_size).to eq 6
      end

      it 'splits into two groups' do
        pipes = Pipes.parse(sample_input)
        expect(pipes.groups.size).to eq 2
      end
    end
  end
end
