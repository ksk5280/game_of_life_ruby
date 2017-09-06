require "rspec"
require "pry"
require "./app/world"
require "./app/cell"
require "./app/board"
# require "./app/live_cell_rules"

describe "LiveCellRules" do
  let(:board) { Board.new }
  let(:world) { World.new }
  let(:cell) { Cell.new}
  subject { LiveCellRules.new }

  context "When a live cell" do
    describe "Has fewer than two live neighbors" do
      it "results in death" do
        board = Board.new(world, [[1,1],[2,0]])
        c1 = world.grid[2][0]
        c2 = world.grid[1][1]
        board.tick!
        expect(c1).to_not be_alive
        expect(c2).to_not be_alive
      end

      it "results in death when it's alone" do
        board = Board.new(world, [[1,1],[2,0]])
        c1 = world.grid[2][0]
        board.tick!
        expect(c1).to_not be_alive
      end


    end


  end
end
