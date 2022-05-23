require_relative 'lib/game'

game = Game.new([7,7], [0,0])
p game.up_left_pos([5,5])
p game.up_left_pos([7,7])
game.knight_moves