require_relative 'knight'

# Game class ...
class Game
  def initialize(initial_pos, final_pos)
    @initial_pos = initial_pos
    @final_pos = final_pos
  end

  # Takes initial position and final position, as separate arrays, on the board position on board
  # Shows the simplest possible way to get from one square to another
  # by outputting all squares the knight will stop on along the way
  def knight_moves(position = @initial_pos)
    return if position.nil?

    knight = create_knight(position)

    knight.up_left = knight_moves(up_left_pos(position))
    knight.up_right = knight_moves(up_right_pos(position))
    knight.down_left = knight_moves(down_left_pos(position))
    knight.down_right = knight_moves(down_right_pos(position))
    knight.left_up = knight_moves(left_up_pos(position))
    knight.left_down = knight_moves(left_down_pos(position))
    knight.right_up = knight_moves(right_up_pos(position))
    knight.right_down = knight_moves(right_down_pos(position))

    knight
  end

  def tree_of_moves; end

  def board
    puts "   0 1 2 3 4 5 6 7
          0 | | | | | | | | |
          1 | | | | | | | | |
          2 | | | | | | | | |
          3 | | | | | | | | |
          4 | | | | | | | | |
          5 | | | | | | | | |
          6 | | | | | | | | |
          7 | | | | | | | | |"
  end

  #private

  def up_left_pos(array)
    (array[0] - 1).negative? || array[1] + 2 > 7 ? nil : [array[0] - 1, array[1] + 2]
  end

  def up_right_pos(array)
    array[0] + 1 > 7 || array[1] + 2 > 7 ? nil : [array[0] + 1, array[1] + 2]
  end

  def down_left_pos(array)
    (array[0] - 1).negative? || (array[1] - 2).negative? ? nil : [array[0] - 1, array[1] - 2]
  end

  def down_right_pos(array)
    array[0] + 1 > 7 || (array[1] - 2).negative? ? nil : [array[0] + 1, array[1] - 2]
  end

  def left_up_pos(array)
    (array[0] - 2).negative? || array[1] + 1 > 7 ? nil : [array[0] - 2, array[1] + 1]
  end

  def left_down_pos(array)
    (array[0] - 2).negative? || (array[1] - 1).negative? ? nil : [array[0] - 2, array[1] - 1]
  end

  def right_up_pos(array)
    array[0] + 2 > 7 || array[1] + 1 > 7 ? nil : [array[0] + 2, array[1] + 1]
  end

  def right_down_pos(array)
    array[0] + 2 > 7 || (array[1] - 1).negative? ? nil : [array[0] + 2, array[1] - 1]
  end

  def create_knight(pos)
    Knight.new(pos)
  end
end
