require_relative 'knight'

# Game class ...
class Game
  def initialize(initial_pos, final_pos)
    @knight = create_knight(initial_pos)
    @final_pos = final_pos
  end

  # Takes initial position and final position, as separate arrays, on the board position on board
  # Shows the simplest possible way to get from one square to another
  # by outputting all squares the knight will stop on along the way
  def knight_moves
    current_node = @knight
    queue = [current_node]
    roots = []
    until current_node.position == @final_pos
      current_node = create_children(current_node)
      roots << current_node.position
      current_node.children.each { |child| queue.push(child) }
      current_node = queue.shift
    end
    path = path_to_destination(current_node.parent, [current_node.position])
    path.reverse
  end

  def path_to_destination(parent, path)
    return if parent.nil?

    path << parent.position
    path_to_destination(parent.parent, path)
    path
  end

  # private

  def create_knight(pos, parent = nil)
    Knight.new(pos, parent)
  end

  def create_children(parent)
    parent.possible_moves.each do |move|
      child = create_knight(move, parent)
      parent.children << child
    end

    parent
  end
end
