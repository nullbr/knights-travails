# Move class to create nodes representing each move in the chess board
class Knight
  attr_accessor :position, :parent, :children
  
  def initialize(position, parent)
    @position = position
    @parent = parent
    @children = []
  end

  def possible_moves
    directions = [[-1, 2], [1, 2], [-1, -2], [1, -2], [-2, -1], [-2, 1], [2, -1], [2, 1]]
    moves = []
    directions.each do |direction|
      x = @position[0] + direction[0]
      y = @position[1] + direction[1]
      moves << [x, y] if x.between?(0, 7) && y.between?(0, 7) && position != [x, y]
    end
    moves
  end
end
