require "rspec"
require_relative "world"

# The purpose of “describe” is to wrap a set of tests against one functionality while “context” is to wrap a set of tests against one functionality under the same state.
describe "World" do
  describe "when initialized" do


    it "creates a world of columns and rows" do
      world = World.new
      expect(world).to respond_to(:rows)
      expect(world).to respond_to(:columns)
    end


  end
end
