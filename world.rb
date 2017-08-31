class World
  attr_accessor :rows, :columns, :grid

  def initialize(rows=3, columns=3)
    @rows = rows
    @columns = columns

    @grid = Array.new(rows) do |row|
      Array.new(columns) do |col|
      end
    end
  end
end
