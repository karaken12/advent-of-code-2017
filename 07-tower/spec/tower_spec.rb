require 'tower'

RSpec.describe Tower do
  context 'part one' do
    context 'with a simple tower' do
      tower = Tower.parse(
        "pbga (66)
        xhth (57)
        ebii (61)
        havc (66)
        ktlj (57)
        fwft (72) -> ktlj, cntj, xhth
        qoyq (66)
        padx (45) -> pbga, havc, qoyq
        tknk (41) -> ugml, padx, fwft
        jptl (61)
        ugml (68) -> gyxo, ebii, jptl
        gyxo (61)
        cntj (57)"
      )
      it 'has tknk as bottom program' do
        expect(tower.bottom).to eq 'tknk'
      end
    end
  end
end