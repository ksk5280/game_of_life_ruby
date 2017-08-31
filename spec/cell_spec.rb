require "rspec"
require "pry"
require "./app/world"

describe "Cell" do
  describe "when initialized" do
    subject { Cell.new }
    let(:world) { World.new }

    it "is a part of a world" do
      world.grid.each do |row|
        row.each do |col|
          expect(col).to be_a(subject)
        end
      end
    end


  end
end
