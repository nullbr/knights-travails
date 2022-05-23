# Move class to create nodes representing each move in the chess board
class Knight
  attr_accessor :position, :up_left, :up_right, :down_left, :down_right, :left_up, :left_down, :right_up, :right_down

  def initialize(array)
    @position = array
    @up_left = nil
    @up_right = nil
    @down_left = nil
    @down_right = nil
    @left_up = nil
    @left_down = nil
    @right_up = nil
    @right_down = nil
  end

  def children
    [@up_left, @up_right, @down_left, @down_right, @left_up, @left_down, @right_up, @right_down]
  end

  def non_nil_children
    children.reject(&:nil?)
  end
end
