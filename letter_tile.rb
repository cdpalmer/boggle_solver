class LetterTile
  attr_accessor :x, :y, :value, :neighbors

  def initialize(x,y)
    @x = x
    @y = y
    @value = Board.values[x][y]
    @neighbors = []
  end

  def neighbors
    @neighbors = populate_neighbors
  end

  def populate_neighbors
    neighbors = []

    neighbors << LetterTile.new(@x,@y-1) unless @y == 0
    neighbors << LetterTile.new(@x,@y+1) unless @y == Board.height - 1
    neighbors << LetterTile.new(@x-1,@y) unless @x == 0
    neighbors << LetterTile.new(@x+1,@y) unless @x == Board.height - 1

    unless (@x == Board.height - 1) || (@y == Board.height - 1)
      neighbors << LetterTile.new(@x+1,@y+1)
    end
    unless (@x == Board.height - 1) || (@y == 0)
      neighbors << LetterTile.new(@x+1,@y-1)
    end
    unless (@x == 0) || (@y == Board.height - 1)
      neighbors << LetterTile.new(@x-1,@y+1)
    end
    unless (@x == 0) || (@y == 0)
      neighbors << LetterTile.new(@x-1,@y-1)
    end

    neighbors
  end
end
