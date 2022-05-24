require_relative 'knight'

# Game class ...
class Game
  DIRECTIONS = [[-1, 2], [1, 2], [-1, -2], [1, -2], [-2, -1], [-2, 1], [2, -1], [2, 1]].freeze

  def initialize(initial_pos, final_pos)
    @knight = create_knight(initial_pos)
    @final_pos = final_pos
  end

  # Takes initial position and final position, as separate arrays, on the board position on board
  # Shows the simplest possible way to get from one square to another
  # by outputting all squares the knight will stop on along the way
  def knight_moves(queue = [@knight], count = 0)
    p count
    return if count > 66 || queue.empty?

    current = queue[0]
    return if current.position == @final_pos

    current = create_children(current)
    current.children.each do |child|
      next if queue.include?(child)

      queue << child
    end
    queue.shift
    knight_moves(queue, count + 1)
    @knight
  end

  # private

  def create_knight(pos)
    Knight.new(pos)
  end

  def create_children(parent)
    parent.possible_moves.each do |move|
      child = create_knight(move)
      parent.children << child
    end

    parent
  end
end
