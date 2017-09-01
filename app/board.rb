require_relative "world"
require_relative "cell"

class Board
  attr_accessor :world, :cells

  def initialize(world=World.new, cells=[])
    @world = world
    @cells = cells
  end

end
