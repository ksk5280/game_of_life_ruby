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
    cells_to_die = []
    cells_to_regain_life = []

    world.cells.each do |cell|
      if is_underpopulated?(cell)
        cells_to_die << cell
      elsif has_cell_stability?(cell)
        cell.alive = true
      elsif is_overcrowded?(cell)
        cells_to_die << cell
      elsif is_reproducible?(cell)
        cells_to_regain_life << cell
      end
    end

    cells_to_die.each { |c| c.die! }
    cells_to_regain_life.each { |c| c.revive! }
  end

  def is_underpopulated?(cell)
    cell.alive? && world.live_neighbors(cell).count < 2
  end

  def has_cell_stability?(cell)
    neighbor_count = cell.alive? && world.live_neighbors(cell).count
    neighbor_count == 3 || neighbor_count == 2
  end

  def is_overcrowded?(cell)
    cell.alive? && world.live_neighbors(cell).count > 3
  end

  def is_reproducible?(cell)
    cell.dead? && world.live_neighbors(cell).count == 3
  end

end


#     [column x0      x 1      x2
#row  [Cell=0,0][Cell=1,0][Cell=2,0],
#     [Cell=0,1][Cell=1,1][Cell=2,1],
#y2   [Cell=0,2][Cell=1,2][Cell=2,2]
#     ]
