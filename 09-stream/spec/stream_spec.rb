require 'stream'

RSpec.describe Stream do
  context 'part one' do
    context 'empty garbage' do
      stream = '<>'
      it 'is empty garbage' do
        tokens = Stream.tokenize(stream)
        expect(tokens.size).to eq 1
        token = tokens[0]
        expect(token.type).to be :garbage
        expect(token.content).to eq ''
      end
    end

    context 'garbage containing random characters' do
      stream = '<random characters>'
      it 'is garbage' do
        tokens = Stream.tokenize(stream)
        expect(tokens.size).to eq 1
        token = tokens[0]
        expect(token.type).to be :garbage
        expect(token.content).to eq 'random characters'
      end
    end
  end
end
