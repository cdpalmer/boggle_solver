class LetterTile
  # T/F flags if tile has been searched
  attr_accessor :n, :ne, :e, :se, :s, :sw, :w, :nw
  attr_accessor :x, :y, :value, :next_letter, :previous_letter

  def initialize(x,y)
    @x = x
    @y = y
    @value = Board.values[x][y]
  end

  def north_tile
    return nil if y == 0
    @n = true
    Tile.new(x,y-1)
  end

  def south_tile
    return nil if y == Board.height - 1
    @s = true
    Tile.new(x,y+1)
  end

  def east_tile
    return nil if x == Board.height - 1
    @e = true
    Tile.new(x+1,y)
  end

  def west_tile
    return nil if x == 0
    @w = true
    Tile.new(x-1,y)
  end

  def southeast_tile
    return nil if (x == Board.height - 1) || (y == Board.height - 1)
    @se = true
    Tile.new(x+1,y+1)
  end

  def northeast_tile
    return nil if (x == Board.height - 1) || (y == 0)
    @ne = true
    Tile.new(x+1,y-1)
  end

  def southwest_tile
    return nil if (x == 0) || (y == Board.height - 1)
    @sw = true
    Tile.new(x-1,y+1)
  end

  def northwest_tile
    return nil if (x == 0) || (y == 0)
  end
end
