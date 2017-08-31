require "rspec"
require "pry"

require "./app/world"
# The purpose of “describe” is to wrap a set of tests against one functionality while “context” is to wrap a set of tests against one functionality under the same state.

describe "World" do
  describe "when initialized" do
    subject { World.new }

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
end
