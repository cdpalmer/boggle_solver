class LetterTile
  attr_accessor :x, :y, :value, :next_letter, :previous_letter

  def initialize(x,y)
    @x = x
    @y = y
    @value = Board.values[x][y]
  end

  def north_tile
    return nil if y == 0
    Tile.new(x,y-1)
  end

  def south_tile
    return nil if y == Board.height
  end

  def east_tile
    return nil if x == Board.height
  end

  def west_tile
    return nil if x == 0
  end

  def northeast_tile
    return nil if y == 0 && x == Board.height
    Tile.new(x-1,y-1)
  end

  def southeast_tile
    return nil if y == Board.height
  end

  def southwest_tile
    return nil if x == Board.height
  end

  def northwest_tile
    return nil if x == 0
  end
end
