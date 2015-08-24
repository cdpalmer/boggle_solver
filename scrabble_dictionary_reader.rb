class ScrabbleDictionaryReader
  # Implement a fuzzy search into the scrabble dictionary for starting values
  # example:
  #   search("cat")
  #   => ['cat', 'cathod', ...]

  def self.search(arg)
    # return fuzzy search array of words

    # This is the list of words in demo board + two more
    library_response = %w( bag gab bare are a rag cody cod doc two more grab )
    library_response.select { |word| word.start_with?(arg) }
  end
end

