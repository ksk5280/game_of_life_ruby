require "rspec"
require "pry"

require "./app/world"

describe "World" do
  subject { World.new }

  describe "when initialized" do
    it "creates a world of columns and rows" do
      expect(subject).to respond_to(:rows)
      expect(subject).to respond_to(:columns)
    end

    context "creates a grid" do
      it "of cells" do
        expect(subject).to respond_to(:grid)
      end

      it "in multi dimensional array form" do
        expect(subject.grid).to be_a(Array)
        subject.grid.each do |row|
          expect(row).to be_a(Array)
        end
      end
    end
  end

  describe "should be aware of the cell neighbors and living conditions" do
    it "knows of the method" do
      expect(subject).to respond_to(:live_neighbors)
    end

    it "detects northern neighbor" do
      north_cell = subject.grid[0][1]
      expect(north_cell).to_not be_alive
      north_cell.alive = true
      expect(north_cell).to be_alive

      south_cell = subject.grid[1][1]
      # binding.pry
      expect(subject.live_neighbors(south_cell).count).to eql(1)
    end

    it "detects southern neighbor" do
      south_cell = subject.grid[1][1]
      expect(south_cell).to_not be_alive
      south_cell.alive = true
      expect(south_cell).to be_alive

      dead_north = subject.grid[0][1]
      expect(subject.live_neighbors(dead_north).count).to eql(1)
    end

    it "detects eastern neighbor" do
      east_cell = subject.grid[1][1]
      east_cell.alive = true
      expect(east_cell).to be_alive

      dead_west = subject.grid[1][0]
      expect(subject.live_neighbors(dead_west).count).to eql(1)
    end

    it "detects western neighbor" do
      west_cell = subject.grid[1][1]
      west_cell.alive = true
      expect(west_cell).to be_alive

      dead_east = subject.grid[1][2]
      expect(subject.live_neighbors(dead_east).count).to eql(1)
    end
  end
end
