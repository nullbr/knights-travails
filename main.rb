require_relative 'lib/game'

game = Game.new
game.knight_moves([0, 0], [7, 7])

game.knight_moves([6, 5], [3, 4])

game.knight_moves([0, 0], [0, 7])

game.knight_moves([0, 0], [1, 2])

game.knight_moves([0, 0], [0, 0])