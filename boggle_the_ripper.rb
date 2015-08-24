require "./boggle"
require 'pp'

puts "Starting Boggle Solver Engine!"
eng = BoggleSolver.new

puts " This is our working board: "
Board.pretty_board;

puts; puts;
eng.start_search

puts; puts;
puts " These are all found words: "
pp eng.found_words
puts
