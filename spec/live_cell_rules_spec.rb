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

  context "When a cell is alive" do
    describe "Has fewer than two live neighbors" do
      it "results results in death" do
        board = Board.new(world, [[1,1],[2,0]])
        # binding.pry
        board.tick!
        # Both only have each other, so dead
        c1 = world.grid[2][0]
        c2 = world.grid[1][1]

        expect(c1).to_not be_alive
        expect(c2).to_not be_alive
      end
    end
  end
end
