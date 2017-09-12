require "rspec"
require "pry"
require "./app/world"
require "./app/cell"
require "./app/board"

describe "CellRules" do
  let(:board) { Board.new }
  let(:world) { World.new }
  let(:cell) { Cell.new}

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

      context "living in an L shape" do
        it "the cells on the edge also live" do
          board = Board.new(world, [[0,1],[1,1],[1,2]])
          c1 = world.grid[0][1]
          c2 = world.grid[1][1]
          c3 = world.grid[1][2]
          board.tick!
          expect(c1).to be_alive
          expect(c3).to be_alive
        end
      end

      context "in a row" do
        it "only kills the neighbors on the edge, center lives" do
          board = Board.new(world, [[1,0],[1,1],[1,2]])
          c1 = world.grid[1][0]
          c2 = world.grid[1][1]
          c3 = world.grid[1][2]
          board.tick!
          expect(c2).to be_alive
          expect(c1).to_not be_alive
          expect(c3).to_not be_alive
        end
      end
    end

    describe "has three live neighbors" do
      context "in vertical line/column" do
        it "it's still stable and survives to next generation" do
          board = Board.new(world, [[1,1],[0,2],[2,2],[1,2]])
          c1 = world.grid[0][2]
          c2 = world.grid[1][1]
          c3 = world.grid[1][2]
          c4 = world.grid[2][2]
          board.tick!
          expect(c2).to be_alive
          expect(c1).to be_alive
          expect(c3).to be_alive
          expect(c4).to be_alive
        end
      end

      context "on three edges" do
        it "center cell survives while edge cells die" do
          board = Board.new(world, [[1,1],[0,2],[2,2],[0,0]])
          c1 = world.grid[0][0]
          c2 = world.grid[1][1]
          c3 = world.grid[2][0]
          board.tick!
          expect(c2).to be_alive
          expect(c1).to_not be_alive
          expect(c3).to_not be_alive
        end
      end
    end

    describe "has more than three live neighbors" do

      context "with four neighbors on the edges" do
        it "all cells die for different reasons" do
          board = Board.new(world, [[1,1],[0,2],[2,2],[0,0],[2,0]])
          c1 = world.grid[0][0]
          c2 = world.grid[1][1]
          c3 = world.grid[2][0]
          board.tick!

          expect(c2).to_not be_alive
          expect(c1).to_not be_alive
          expect(c3).to_not be_alive
        end
      end

      context "with five neighboring cells forming a T - shape" do
        it "bottom two cells die; one from over and one from under" do
          board = Board.new(world, [[1,1],[0,1],[0,2],[0,0],[2,1]])
          c1 = world.grid[0][0]
          c2 = world.grid[0][1]
          c3 = world.grid[0][2]
          c4 = world.grid[1][1]
          c5 = world.grid[2][1]

          board.tick!

          expect(c2).to be_alive
          expect(c1).to be_alive

          expect(c4).to_not be_alive
          expect(c5).to_not be_alive
        end
      end

    end


  end

  context "When a dead cell" do
    describe "has exactly 3 live neighbors" do
      it "becomes alive" do
        board = Board.new(world, [[0,1],[0,2],[0,0]])
        c1 = world.grid[0][0]
        c2 = world.grid[0][1]
        c3 = world.grid[0][2]
        c4 = world.grid[1][1]

        expect(c4).to be_dead
        board.tick!

        expect(c2).to be_alive
        expect(c4).to be_alive
      end

    end
  end
end
