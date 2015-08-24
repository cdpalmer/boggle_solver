class BoggleSolver
  %w(board boggle letter_tile scrabble_dictionary_reader word).each do |file|
    require "./#{file}.rb"
  end

  attr_accessor :found_words

  def initialize
    @found_words = []
  end

  def start_search
    Board.values.each_with_index do |row, y|
      row.each_with_index do |letter, x|
        @current_tile = LetterTile.new(x,y)
        @current_word = Word.new
        @current_word.push(@current_tile)
        puts "  Searching at tile #{@current_tile.value.upcase} at (#{x},#{y})"
        search(@current_word)
      end
    end
  end

  def search(word)
    matches = ScrabbleDictionaryReader.search(word.print_word)
    unless matches.empty?
      if matches.include?(word.print_word)
        puts "  Found word! (#{word.print_word})"
        @found_words << word.print_word
      end
    end
  end

  def root_node?(tile)
    tile.previous_letter == nil
  end
end
