class Board
  def self.height
    5
  end

  def self.values
    # [
      # %w(x x b x x),
      # %w(x x a g x),
      # %w(x e r x y),
      # %w(x x x x d),
      # %w(x x x c o)
    # ]
    [
      %w(n n y n s),
      %w(m d q x s),
      %w(n o c x s),
      %w(x p r x s),
      %w(0 1 2 3 s)
    ]
  end

  def self.pretty_board
    self.values.each do |row|
      out = row.join(" ").upcase
      puts "    #{out}"
    end
  end
end
