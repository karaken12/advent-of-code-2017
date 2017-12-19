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
    end
  end
end
