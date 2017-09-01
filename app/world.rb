require_relative "cell"

class World
  attr_accessor :rows, :columns, :grid

  def initialize(rows=3, columns=3)
    @rows = rows
    @columns = columns

    @grid = Array.new(rows) do |row|
      Array.new(columns) do |col|
        Cell.new(col, row)
      end
    end
  end

  def live_neighbors(cell)
    # incoming cell is dead pointer
    living = []

    # North
    if cell.y > 0
      live_N = self.grid[cell.y - 1][cell.x]
      living << live_N if live_N.alive?
    end
    # South
    if cell.y < (rows - 1)
      live_S = self.grid[cell.y + 1][cell.x]
      living << live_S if live_S.alive?
    end
    # East
    if cell.x < (columns - 1)
      live_E = self.grid[cell.y][cell.x + 1]
      living << live_E if live_E.alive?
    end
    # West
    if cell.x > 0
      live_W = self.grid[cell.y][cell.x - 1]
      living << live_W if live_W.alive?
    end

    living
  end
end

#     [column x0      x 1      x2
#row  [Cell=0,0][Cell=1,0][Cell=2,0],
#     [Cell=0,1][Cell=1,1][Cell=2,1],
#y2   [Cell=0,2][Cell=1,2][Cell=2,2]
#     ]
