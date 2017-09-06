require_relative "world"
require_relative "location"

class Cell
  attr_accessor :x, :y, :alive

  def initialize(x=0,y=0)
    @x = x
    @y = y
    @alive = false
  end

  def alive?
    alive
  end

  def dead?
    !alive?
  end

  def revive!
    @alive = true
  end

  def die!
    @alive = false
  end
end
