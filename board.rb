class Board
  def self.height
    5
  end

  def self.values
    [
      %w(x x b x x),
      %w(x x a g x),
      %w(x e r x y),
      %w(x x x x d),
      %w(x x x c o)
    ]
  end

  def self.pretty_board
    self.values.each do |row|
      out = row.join(" ").upcase
      puts "    #{out}"
    end
  end
end
