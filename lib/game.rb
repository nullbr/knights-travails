require_relative 'knight'

# Game class ...
class Game
  # Takes initial position and final position, as separate arrays, on the board position on board
  # Shows the simplest possible way to get from one square to another
  # by outputting all squares the knight will stop on along the way
  def knight_moves(initial_pos, final_pos)
    current_knight = create_knight(initial_pos)
    queue = [current_knight]
    until current_knight.position == final_pos
      current_knight = create_children(current_knight)
      current_knight.children.each { |child| queue.push(child) }
      current_knight = queue.shift
    end
    path = path_to_destination(current_knight.parent, [final_pos], initial_pos == final_pos)
    print_path(path)
  end

  def path_to_destination(parent, path, zero_path)
    return path if zero_path
    return if parent.nil?

    path << parent.position
    path_to_destination(parent.parent, path, false)
    path.reverse
  end

  def print_path(path)
    moves_num = path.size - 1
    puts "You made it in #{moves_num} #{moves_num == 1 ? 'move' : 'moves'}!  Here's your path:"
    path.each { |pos| p pos }
  end

  private

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
