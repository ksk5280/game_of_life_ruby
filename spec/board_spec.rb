require "rspec"
require "pry"
require "./app/world"
require "./app/cell"
require "./app/board"

describe "Board" do
  subject { Board.new }

  describe "is built and" do
    let(:world) { World.new }
    # let(:cell)  { Cell.new}

    it "should create a new board game object" do
      expect(subject).to be_truthy
    end

    it "has proper knowledge of methods" do
      expect(subject).to respond_to(:world)
      expect(subject).to respond_to(:cells)
    end

    it "should seed cells across grid" do
      b1 = Board.new(world, [[1,1],[2,0]])
      cell1 = world.grid[1,1].first[1]
      cell2 = world.grid[2][0]
      expect(cell1).to be_alive
      expect(cell2).to be_alive
    end
  end
end
