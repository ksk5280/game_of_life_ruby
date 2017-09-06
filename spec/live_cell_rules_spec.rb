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

    describe "has two live neighbors" do
      it "is stable and survives to next generation" do
        board = Board.new(world, [[1,1],[2,0],[2,2]])
        c1 = world.grid[2][0]
        c2 = world.grid[1][1]
        c3 = world.grid[2][2]
        board.tick!
        expect(c2).to be_alive
      end
    end

    describe "has three live neighbors" do
      context "in vertical line/column" do
        it "it's still stable and survives to next generation" do
          board = Board.new(world, [[1,1],[0,2],[2,2],[1,2]])
          c2 = world.grid[1][1]
          board.tick!
          expect(c2).to be_alive
        end
      end

      context "on three edges" do
        it "it survives" do
          board = Board.new(world, [[1,1],[0,2],[2,2],[0,0]])
          c2 = world.grid[1][1]
          binding.pry
          board.tick!
          expect(c2).to be_alive
        end
      end
    end


  end
end
