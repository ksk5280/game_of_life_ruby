require "rspec"
require_relative "world"

# The purpose of “describe” is to wrap a set of tests against one functionality while “context” is to wrap a set of tests against one functionality under the same state.
describe "World" do
  describe "when initialized" do

    subject { World.new }
# NOTE: When created, it's empty and dead. First tick: cell generation

    it "creates a world of columns and rows" do
      expect(subject).to respond_to(:rows)
      expect(subject).to respond_to(:columns)
    end

    it "creates a grid of dead cells" do
      expect(subject).to respond_to(:grid)
      expect(subject.grid).to be_a(Array)
    end


  end
end
