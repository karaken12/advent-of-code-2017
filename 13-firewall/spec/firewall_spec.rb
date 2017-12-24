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
    end
  end
end
