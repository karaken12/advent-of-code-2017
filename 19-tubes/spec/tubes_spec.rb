require 'tubes'

RSpec.describe Tubes do
  context 'part one' do
    context 'simple path' do
      path = (
'     |          
     |  +--+    
     A  |  C    
 F---|----E|--+ 
     |  |  |  D 
     +B-+  +--+'
      )
      tubes = Tubes.new(path)
      it 'should see ABCDEF' do
        letters = tubes.follow
        expect(letters).to eq 'ABCDEF'
      end
      it 'should go 38 steps' do
        steps = tubes.follow_steps
        expect(steps).to eq 38
      end
    end
  end
end
