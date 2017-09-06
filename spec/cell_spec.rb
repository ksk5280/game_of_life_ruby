require "rspec"
require "pry"
require "./app/world"
require "./app/cell"

describe "Cell" do
  subject { Cell.new }
  let(:world) { World.new }

  describe "when initialized" do
    it "has a location attributes" do
      expect(subject).to respond_to(:x)
      expect(subject).to respond_to(:y)
    end

    it "is dead to start" do
      expect(subject).to_not be_alive
    end
  end

  describe "without less than 2 neighbors" do
    it "will die" do
      subject.die!
      expect(subject).to_not be_alive
    end
  end
end
