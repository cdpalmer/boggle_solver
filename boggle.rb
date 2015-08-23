class BoggleSolver
  def initialize
    Board.values.each_with_index do |row, y|
      row.each_with_index do |letter, x|
        current_tile = Tile.new(x,y)
        search(current_tile)
      end
    end
  end

  def search(tile)
    current_word = Word.new
    current_word.push(tile)
  end
end
