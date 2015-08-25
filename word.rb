class Word
  attr_accessor :letters

  def initialize
    @letters = []
  end

  def has_letter?(letter)
    !@letters.select { |l| (l.x == letter.x && l.y == letter.y) }.empty?
  end

  def push(tile)
    if @letters.empty?
      @letters << tile
    else
      @letters << tile
    end
  end

  def pop
    if @letters.empty?
      nil
    else
      @letters.pop
    end
  end

  def count
    @letters.length
  end

  def print_word
    @letters.map(&:value).join('')
  end
end
