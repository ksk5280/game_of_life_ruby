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
    live_neighbors = []

    
    live_neighbors
  end
end

#     [column x0      x 1      x2
#row  [Cell=0,0][Cell=1,0][Cell=2,0],
#     [Cell=0,1][Cell=1,1][Cell=2,1],
#y2   [Cell=0,2][Cell=1,2][Cell=2,2]
#     ]
