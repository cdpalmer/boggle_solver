class Word
  attr_accessor :letters

  def initialize
    @letters = []
  end

  def push(tile)
    if @letters.empty?
      @letters << tile
    else
      @letters.last.next_letter = tile
      tile.previous_letter = @letters.last
      @letters << tile
    end
  end

  def pop(tile)
  end

  def count
    @letters.length
  end

  def print_word
    @letters.map(&:value).join('')
  end
end
