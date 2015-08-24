class LetterTile
  # T/F flags if tile has been searched
  attr_accessor :n, :ne, :e, :se, :s, :sw, :w, :nw
  attr_accessor :x, :y, :value

  def initialize(x,y)
    @x = x
    @y = y
    @value = Board.values[x][y]

    if x == 0
      @nw = @w = @sw = true
    end

    if y == 0
      @nw = @n = @ne = true
    end

    if x == Board.height - 1
      @ne = @e = @se = true
    end

    if y == Board.height - 1
      @se = @s = @sw = true
    end
  end

  def north_tile
    return nil if @y == 0
    LetterTile.new(@x,@y-1)
  end

  def south_tile
    return nil if @y == Board.height - 1
    LetterTile.new(@x,@y+1)
  end

  def east_tile
    return nil if @x == Board.height - 1
    LetterTile.new(@x+1,@y)
  end

  def west_tile
    return nil if @x == 0
    LetterTile.new(@x-1,@y)
  end

  def southeast_tile
    return nil if (@x == Board.height - 1) || (@y == Board.height - 1)
    LetterTile.new(@x+1,@y+1)
  end

  def northeast_tile
    return nil if (@x == Board.height - 1) || (@y == 0)
    LetterTile.new(@x+1,@y-1)
  end

  def southwest_tile
    return nil if (@x == 0) || (@y == Board.height - 1)
    LetterTile.new(@x-1,@y+1)
  end

  def northwest_tile
    return nil if (@x == 0) || (@y == 0)
    LetterTile.new(@x-1,@y-1)
  end

  def dead_node?
    @n && @ne && @e && @se && @s && @sw && @w && @nw
  end

  def root_node?
    @previous_letter == nil
  end
end
