require 'registers'
require 'instructions'

RSpec.describe Registers do
  context 'part one' do
    context 'the sample program' do
      instructions = Instructions.parse(
        "b inc 5 if a > 1
        a inc 1 if b < 5
        c dec -10 if a >= 1
        c inc -20 if c == 10"
      )
      registers = Registers.new
      it 'should leave the largest value at 1' do
        registers.instruct(instructions)
        expect(registers.largest_value).to eq 1
      end
    end
  end
end
