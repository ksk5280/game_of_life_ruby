require "rspec"
require "pry"

require "./app/world"
# The purpose of “describe” is to wrap a set of tests against one functionality while “context” is to wrap a set of tests against one functionality under the same state.

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

    it "detects northern neighbors" do
      north_cell = subject.grid[0][1]
      expect(north_cell).to_not be_alive
      north_cell.alive = true
      expect(north_cell).to be_alive
    end
  end
end
