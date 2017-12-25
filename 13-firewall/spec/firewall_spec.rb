require 'firewall'

RSpec.describe Firewall do
  context 'part one' do
    context 'with the sample firewall' do
      rules = {0 => 3, 1 => 2, 4 => 4, 6 => 4}
      it 'looks like this at picosecond 0' do
        firewall = Firewall.new(rules)
        expect(firewall.to_s).to eq 'Picosecond 0:
 0   1   2   3   4   5   6 
[S] [S] ... ... [S] ... [S]
[ ] [ ]         [ ]     [ ]
[ ]             [ ]     [ ]
                [ ]     [ ]'
      end

      it 'looks like this at picosecond 1' do
        firewall = Firewall.new(rules)
        firewall.advance
        expect(firewall.to_s).to eq 'Picosecond 1:
 0   1   2   3   4   5   6 
[ ] [ ] ... ... [ ] ... [ ]
[S] [S]         [S]     [S]
[ ]             [ ]     [ ]
                [ ]     [ ]'
      end

      it 'looks like this at picosecond 2' do
        firewall = Firewall.new(rules)
        2.times { firewall.advance }
        expect(firewall.to_s).to eq 'Picosecond 2:
 0   1   2   3   4   5   6 
[ ] [S] ... ... [ ] ... [ ]
[ ] [ ]         [ ]     [ ]
[S]             [S]     [S]
                [ ]     [ ]'
      end

      it 'looks like this at picosecond 3' do
				firewall = Firewall.new(rules)
        3.times { firewall.advance }
        expect(firewall.to_s).to eq 'Picosecond 3:
 0   1   2   3   4   5   6 
[ ] [ ] ... ... [ ] ... [ ]
[S] [S]         [ ]     [ ]
[ ]             [ ]     [ ]
                [S]     [S]'
      end

      context 'and an injected packet' do
        it 'looks like this at picosecond 0' do
          firewall = Firewall.new(rules)
          firewall.inject
          expect(firewall.to_s).to eq 'Picosecond 0:
 0   1   2   3   4   5   6 
(S) [S] ... ... [S] ... [S]
[ ] [ ]         [ ]     [ ]
[ ]             [ ]     [ ]
                [ ]     [ ]'
        end

        it 'looks like this at picosecond 1' do
          firewall = Firewall.new(rules)
          firewall.inject
          firewall.advance
          expect(firewall.to_s).to eq 'Picosecond 1:
 0   1   2   3   4   5   6 
[ ] ( ) ... ... [ ] ... [ ]
[S] [S]         [S]     [S]
[ ]             [ ]     [ ]
                [ ]     [ ]'
        end

        it 'looks like this at picosecond 2' do
          firewall = Firewall.new(rules)
          firewall.inject
          2.times { firewall.advance }
          expect(firewall.to_s).to eq 'Picosecond 2:
 0   1   2   3   4   5   6 
[ ] [S] (.) ... [ ] ... [ ]
[ ] [ ]         [ ]     [ ]
[S]             [S]     [S]
                [ ]     [ ]'
        end

        it 'looks like this at picosecond 3' do
          firewall = Firewall.new(rules)
          firewall.inject
          3.times { firewall.advance }
          expect(firewall.to_s).to eq 'Picosecond 3:
 0   1   2   3   4   5   6 
[ ] [ ] ... (.) [ ] ... [ ]
[S] [S]         [ ]     [ ]
[ ]             [ ]     [ ]
                [S]     [S]'
        end

        it 'looks like this at picosecond 4' do
          firewall = Firewall.new(rules)
          firewall.inject
          4.times { firewall.advance }
          expect(firewall.to_s).to eq 'Picosecond 4:
 0   1   2   3   4   5   6 
[S] [S] ... ... ( ) ... [ ]
[ ] [ ]         [ ]     [ ]
[ ]             [S]     [S]
                [ ]     [ ]'
        end

        it 'looks like this at picosecond 5' do
          firewall = Firewall.new(rules)
          firewall.inject
          5.times { firewall.advance }
          expect(firewall.to_s).to eq 'Picosecond 5:
 0   1   2   3   4   5   6 
[ ] [ ] ... ... [ ] (.) [ ]
[S] [S]         [S]     [S]
[ ]             [ ]     [ ]
                [ ]     [ ]'
        end

        it 'looks like this at picosecond 6' do
          firewall = Firewall.new(rules)
          firewall.inject
          6.times { firewall.advance }
          expect(firewall.to_s).to eq 'Picosecond 6:
 0   1   2   3   4   5   6 
[ ] [S] ... ... [S] ... (S)
[ ] [ ]         [ ]     [ ]
[S]             [ ]     [ ]
                [ ]     [ ]'
        end
      end

      context 'a packet is caught' do
        it 'is caught in layer 0' do
          firewall = Firewall.new(rules)
          firewall.inject
          expect(firewall.packet_is_caught).to be true
        end

        it 'is caught in layer 6' do
          firewall = Firewall.new(rules)
          firewall.inject
          6.times { firewall.advance }
          expect(firewall.packet_is_caught).to be true
        end

        it 'is not caught in layer 2' do
          firewall = Firewall.new(rules)
          firewall.inject
          2.times { firewall.advance }
          expect(firewall.packet_is_caught).to be false
        end
      end

      context 'a complete packet transition' do
        it 'has severity 24' do
          firewall = Firewall.new(rules)
          firewall.inject
          firewall.traverse
          expect(firewall.severity).to eq 24
        end
      end
    end
  end
end
