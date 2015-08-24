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
        # puts "  Searching at tile #{@current_tile.value.upcase} at (#{x},#{y})"
        search(@current_word)
      end
    end
  end

  def search(word)
    @current_tile = word.letters.last
    puts "    Starting search with #{word.print_word.upcase}"
    matches = ScrabbleDictionaryReader.search(word.print_word)
    if matches.empty?
      puts "     - Done searching at (#{@current_tile.x},#{@current_tile.y})"
    else
      if matches.include?(word.print_word)
        puts "*   Found word! (#{word.print_word})"
        @found_words << word.print_word
      end

      # This should be meta-programmed
      if @current_tile.north_tile && @current_tile.n.nil?
        @current_tile.n = true
        word.push(@current_tile.north_tile)
        puts "    Moving on search with #{word.print_word.upcase}"
        puts "     n"
        search(word)
        word.pop
        @current_tile = word.letters.last
      end
      if @current_tile.northeast_tile && @current_tile.ne.nil?
        @current_tile.ne = true
        word.push(@current_tile.northeast_tile)
        puts "    Moving on search with #{word.print_word.upcase}"
        puts "     ne"
        search(word)
        word.pop
        @current_tile = word.letters.last
      end
      if @current_tile.east_tile && @current_tile.e.nil?
        @current_tile.e = true
        word.push(@current_tile.east_tile)
        puts "    Moving on search with #{word.print_word.upcase}"
        puts "     e"
        search(word)
        word.pop
        @current_tile = word.letters.last
      end
      if @current_tile.southeast_tile && @current_tile.se.nil?
        @current_tile.se = true
        word.push(@current_tile.southeast_tile)
        puts "    Moving on search with #{word.print_word.upcase}"
        puts "     se"
        search(word)
        word.pop
        @current_tile = word.letters.last
      end
      if @current_tile.south_tile && @current_tile.s.nil?
        @current_tile.s = true
        word.push(@current_tile.south_tile)
        puts "    Moving on search with #{word.print_word.upcase}"
        puts "     s"
        search(word)
        word.pop
        @current_tile = word.letters.last
      end
      if @current_tile.southwest_tile && @current_tile.sw.nil?
        @current_tile.sw = true
        word.push(@current_tile.southwest_tile)
        puts "    Moving on search with #{word.print_word.upcase}"
        puts "     sw"
        search(word)
        word.pop
        @current_tile = word.letters.last
      end
      if @current_tile.west_tile && @current_tile.w.nil?
        @current_tile.w = true
        word.push(@current_tile.west_tile)
        puts "    Moving on search with #{word.print_word.upcase}"
        puts "     w"
        search(word)
        word.pop
        @current_tile = word.letters.last
      end
      if @current_tile.northwest_tile && @current_tile.nw.nil?
        @current_tile.nw = true
        word.push(@current_tile.northwest_tile)
        puts "    Moving on search with #{word.print_word.upcase}"
        puts "     nw"
        search(word)
        word.pop
        @current_tile = word.letters.last
      end
    end
  end
end
