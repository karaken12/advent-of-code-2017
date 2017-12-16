require 'maze'

RSpec.describe Maze do
  context 'part one' do
    context 'sample maze' do
      maze = Maze.new [0, 3, 0, 1, -3]
      maze.log = true
      it 'take five steps to escape' do
        maze.escape
        expect(maze.step).to eq 5
      end
    end
  end

  context 'part two' do
    context 'sample maze' do
      maze = Maze.new [0, 3, 0, 1, -3]
      maze.log = true
      maze.mode = 2
      it 'takes ten steps to escape' do
        maze.escape
        expect(maze.step).to eq 10
      end
    end
  end
end
