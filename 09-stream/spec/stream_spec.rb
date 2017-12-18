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

    context 'empty group' do
      stream = '{}'
      it 'is a single group' do
        tokens = Stream.tokenize(stream)
        expect(tokens.size).to eq 2
        expect(tokens.map{|t| t.type}).to eq [:group_start, :group_end]
      end
      it 'counts as one group' do
        tokens = Stream.tokenize(stream)
        groups = Stream.count_groups(tokens)
        expect(groups).to eq 1
      end
    end

    context 'three nested groups' do
      stream = '{{{}}}'
      it 'counts as three groups' do
        tokens = Stream.tokenize(stream)
        groups = Stream.count_groups(tokens)
        expect(groups).to eq 3
      end
    end

    context 'three groups in two levels' do
      stream = '{{},{}}'
      it 'counts as three groups' do
        tokens = Stream.tokenize(stream)
        groups = Stream.count_groups(tokens)
        expect(groups).to eq 3
      end
    end

    context 'several groups' do
      stream = '{{{},{},{{}}}}'
      it 'counts as six groups' do
        tokens = Stream.tokenize(stream)
        groups = Stream.count_groups(tokens)
        expect(groups).to eq 6
      end
    end

    context 'group with garbaged groups' do
      stream = '{<{},{},{{}}>}'
      it 'counts as 1 group (which itself contains garbage)' do
        tokens = Stream.tokenize(stream)
        groups = Stream.count_groups(tokens)
        expect(groups).to eq 1
      end
    end

    context 'group with multiple garbages' do
      stream = '{<a>,<a>,<a>,<a>}'
      it 'counts as 1 group' do
        tokens = Stream.tokenize(stream)
        groups = Stream.count_groups(tokens)
        expect(groups).to eq 1
      end
    end

    context 'multiple groups with garbage each' do
      stream = '{{<a>},{<a>},{<a>},{<a>}}'
      it 'counts as 5 groups' do
        tokens = Stream.tokenize(stream)
        groups = Stream.count_groups(tokens)
        expect(groups).to eq 5
      end
    end

    context 'group tokens eaten by garbage' do
      stream = '{{<!>},{<!>},{<!>},{<a>}}'
      it 'counts as 2 groups (since all but the last > are canceled)' do
        tokens = Stream.tokenize(stream)
        expect(tokens.select{|t| t.type == :separator}.count).to eq 0
        groups = Stream.count_groups(tokens)
        expect(groups).to eq 2
      end
    end
  end
end
