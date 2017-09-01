require "rspec"
require "pry"
require "./app/world"
require "./app/cell"
require "./app/board"

describe "Board" do
  subject { Board.new }

  describe "is initialized" do
    # let(:world) { World.new }
    # let(:cell)  { Cell.new}

    it "should create a new board game object" do
      expect(subject).to be_truthy
    end

    it "has proper knowledge of methods" do
      # binding.pry
      expect(subject).to respond_to(:world)
      expect(subject).to respond_to(:cells)
    end
  end
end
