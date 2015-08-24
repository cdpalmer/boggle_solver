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
        search(@current_word)
      end
    end
  end

  def search(word)
    @current_tile = word.letters.last
    matches = ScrabbleDictionaryReader.search(word.print_word)
    unless matches.empty?
      if matches.include?(word.print_word)
        puts "*   Found word! (#{word.print_word})"
        @found_words << word.print_word
      end

      #################################
      # NOTE!!
      # This should be meta-programmed and/or refactored
      #   I know this isn't the cleanest
      #################################
      if @current_tile.north_tile && @current_tile.n.nil?
        @current_tile.n = true
        unless word.has_letter?(@current_tile.north_tile)
          word.push(@current_tile.north_tile)
          search(word)
          word.pop
          @current_tile = word.letters.last
        end
      end
      if @current_tile.northeast_tile && @current_tile.ne.nil?
        @current_tile.ne = true
        unless word.has_letter?(@current_tile.northeast_tile)
          word.push(@current_tile.northeast_tile)
          search(word)
          word.pop
          @current_tile = word.letters.last
        end
      end
      if @current_tile.east_tile && @current_tile.e.nil?
        @current_tile.e = true
        unless word.has_letter?(@current_tile.east_tile)
          word.push(@current_tile.east_tile)
          search(word)
          word.pop
          @current_tile = word.letters.last
        end
      end
      if @current_tile.southeast_tile && @current_tile.se.nil?
        @current_tile.se = true
        unless word.has_letter?(@current_tile.southeast_tile)
          word.push(@current_tile.southeast_tile)
          search(word)
          word.pop
          @current_tile = word.letters.last
        end
      end
      if @current_tile.south_tile && @current_tile.s.nil?
        @current_tile.s = true
        unless word.has_letter?(@current_tile.south_tile)
          word.push(@current_tile.south_tile)
          search(word)
          word.pop
          @current_tile = word.letters.last
        end
      end
      if @current_tile.southwest_tile && @current_tile.sw.nil?
        @current_tile.sw = true
        unless word.has_letter?(@current_tile.southwest_tile)
          word.push(@current_tile.southwest_tile)
          search(word)
          word.pop
          @current_tile = word.letters.last
        end
      end
      if @current_tile.west_tile && @current_tile.w.nil?
        @current_tile.w = true
        unless word.has_letter?(@current_tile.west_tile)
          word.push(@current_tile.west_tile)
          search(word)
          word.pop
          @current_tile = word.letters.last
        end
      end
      if @current_tile.northwest_tile && @current_tile.nw.nil?
        @current_tile.nw = true
        unless word.has_letter?(@current_tile.northwest_tile)
          word.push(@current_tile.northwest_tile)
          search(word)
          word.pop
          @current_tile = word.letters.last
        end
      end
    end
  end
end
