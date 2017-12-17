require 'tower'

RSpec.describe Tower do
  sample_data = (
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
     cntj (57)")

  context 'part one' do
    context 'with a simple tower' do
      tower = Tower.parse(sample_data)
      it 'has tknk as bottom program' do
        expect(tower.bottom.name).to eq 'tknk'
      end
    end
  end

  context 'create structure' do
    context 'with a simple tower' do
      tower = Tower.parse(sample_data)
      it 'has tknk as bottom program' do
        expect(tower.bottom.name).to eq 'tknk'
      end
      it 'has ugml, padx, and fwft being held by tknk' do
        expect(tower.bottom.holding.map{|p| p.name}).to eq ['ugml', 'padx', 'fwft']
      end
      it 'has gyxo being held by ugml' do
        expect(tower.bottom.holding[0].holding[0].name).to eq 'gyxo'
        expect(tower.bottom.holding[0].holding[0].weight).to eq 61
      end
    end
  end

  context 'part two' do
    balanced_sample = (
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
      ugml (60) -> gyxo, ebii, jptl
      gyxo (61)
      cntj (57)")

    context 'a program holding nothing' do
      program = Tower::Program.new('gyxo', 61, [])
      it 'is balanced' do
        expect(program.balanced).to be true
      end
    end

    context 'a program holding three same weighted programs' do
      program = Tower::Program.new('ugml', 68, [
        Tower::Program.new('gyxo', 61, []),
        Tower::Program.new('ebii', 61, []),
        Tower::Program.new('jptl', 61, [])])
      it 'is balanced' do
        expect(program.balanced).to be true
      end
    end

    context 'a program holding three differently weighted programs' do
      program = Tower::Program.new('ugml', 68, [
        Tower::Program.new('gyxo', 61, []),
        Tower::Program.new('pbga', 66, []),
        Tower::Program.new('jptl', 61, [])])
      it 'is unbalanced' do
        expect(program.balanced).to be false
      end
    end

    context 'a program holding three same weighted towers' do
      program = Tower.parse(balanced_sample).bottom
      it 'is balanced' do
        expect(program.balanced).to be true
      end
    end

    context 'a program holding differently weighted towers' do
      program = Tower.parse(sample_data).bottom
      it 'is unbalanced' do
        expect(program.balanced).to be false
      end
    end
  end
end
