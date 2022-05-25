require_relative 'lib/game'
require_relative 'lib/knight'

game = Game.new([0, 0], [7, 7])
p game.knight_moves

game = Game.new([5, 5], [6, 7])
p game.knight_moves

game = Game.new([6, 5], [1, 7])
p game.knight_moves
