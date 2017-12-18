require 'stream'

RSpec.describe Stream do
  context 'part one' do
    context 'empty garbage' do
      stream = '<>'
      it 'is empty garbage' do
        tokens = Stream.tokenize(stream)
        expect(tokens.size).to eq 3
        expect(tokens[0].type).to eq :garbage_start
        expect(tokens[2].type).to eq :garbage_end
        token = tokens[1]
        expect(token.type).to be :garbage_content
        expect(token.content).to eq ''
      end
    end

    context 'garbage containing random characters' do
      stream = '<random characters>'
      it 'is garbage' do
        tokens = Stream.tokenize(stream)
        expect(tokens.size).to eq 3
        expect(tokens[0].type).to eq :garbage_start
        expect(tokens[2].type).to eq :garbage_end
        token = tokens[1]
        expect(token.type).to be :garbage_content
        expect(token.content).to eq 'random characters'
      end
    end

    context 'garbage containing extra <s' do
      stream = '<<<<>'
      it 'is garbage; extra <s are ignored' do
        tokens = Stream.tokenize(stream)
        expect(tokens.size).to eq 3
        expect(tokens[0].type).to eq :garbage_start
        expect(tokens[2].type).to eq :garbage_end
        token = tokens[1]
        expect(token.type).to be :garbage_content
        expect(token.content).to eq '<<<'
      end
    end

    context 'garbage containing cancelled characters' do
      stream = '<{!>}>'
      it 'is garbage, because the first > is cancelled' do
        tokens = Stream.tokenize(stream)
        expect(tokens.size).to eq 3
        expect(tokens[0].type).to eq :garbage_start
        expect(tokens[2].type).to eq :garbage_end
        token = tokens[1]
        expect(token.type).to be :garbage_content
        expect(token.content).to eq '{}'
      end
    end

    context 'garbage containing !!' do
      stream = '<!!>'
      it 'is garbage, because the second ! is cancelled' do
        tokens = Stream.tokenize(stream)
        expect(tokens.size).to eq 3
        expect(tokens[0].type).to eq :garbage_start
        expect(tokens[2].type).to eq :garbage_end
        token = tokens[1]
        expect(token.type).to be :garbage_content
        expect(token.content).to eq ''
      end
    end

    context 'garbage containing more cancelled characters' do
      stream = '<!!!>>'
      it 'is garbage, because the second ! and the first > are cancelled' do
        tokens = Stream.tokenize(stream)
        expect(tokens.size).to eq 3
        expect(tokens[0].type).to eq :garbage_start
        expect(tokens[2].type).to eq :garbage_end
        token = tokens[1]
        expect(token.type).to be :garbage_content
        expect(token.content).to eq ''
      end
    end

    context 'garbage with characters all over t\'shop' do
      stream = '<{o"i!a,<{i<a>'
      it 'is garbage, which ends at the first >' do
        tokens = Stream.tokenize(stream)
        expect(tokens.size).to eq 3
        expect(tokens[0].type).to eq :garbage_start
        expect(tokens[2].type).to eq :garbage_end
        token = tokens[1]
        expect(token.type).to be :garbage_content
      end
    end
  end
end
