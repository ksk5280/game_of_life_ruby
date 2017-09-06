require_relative "world"
require_relative "cell"
require "pry"

class Board
  attr_accessor :world, :cells

  def initialize(world=World.new, cells=[])
    @world = world
    @cells = cells

    cells.each do |cell_row|
      world.grid[cell_row[0]][cell_row[1]].alive = true
    end
  end

  def tick!
    world.cells.each do |cell|
      if is_underpopulated?(cell)
        cell.die!
      elsif has_cell_stability?(cell)
        cell.alive = true
      end
    end
  end

  def is_underpopulated?(cell)
    cell.alive? && world.live_neighbors(cell).count < 2
  end

  def has_cell_stability?(cell)
    cell.alive? && world.live_neighbors(cell).count == 2
  end

end


# [
# [Cell=0,0][Cell=1,0][Cell=2,0],
# [Cell=0,1][Cell=1,1][Cell=2,1],
# [Cell=0,2][Cell=1,2][Cell=2,2]
# ]
