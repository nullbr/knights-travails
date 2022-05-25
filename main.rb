require_relative 'lib/game'

game = Game.new
p game.knight_moves([0, 0], [7, 7])

p game.knight_moves([6, 5], [3, 4])

p game.knight_moves([0, 0], [0, 7])
