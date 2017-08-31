require_relative "world"

class Cell
  attr_accessor :x, :y

  def initialize(x=1,y=1)
    @x = x
    @y = y
  end

end
