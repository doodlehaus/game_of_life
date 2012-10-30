require './board'
require './cell'
require './renderer'

# blinker
#@board = Board.new(5)
#Cell.new(@board, 2, 1)
#Cell.new(@board, 2, 2)
#Cell.new(@board, 2, 3)

#toad
#@board = Board.new(6)
#Cell.new(@board, 2, 2)
#Cell.new(@board, 2, 3)
#Cell.new(@board, 2, 4)
#Cell.new(@board, 3, 1)
#Cell.new(@board, 3, 2)
#Cell.new(@board, 3, 3)

#beacon
@board = Board.new(6)
Cell.new(@board, 1, 1)
Cell.new(@board, 2, 1)
Cell.new(@board, 1, 2)
Cell.new(@board, 2, 2)
Cell.new(@board, 3, 3)
Cell.new(@board, 3, 4)
Cell.new(@board, 4, 3)
Cell.new(@board, 4, 4)

@renderer = Renderer.new(@board)

generations = 10
@renderer.clear
(0..10).each do |gen|
  STDOUT.write "\r#{@renderer.render}";sleep 1;@renderer.clear
  @board.tick!
end
