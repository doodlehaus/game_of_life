class Cell

  attr_accessor :board, :x, :y
  def initialize(board, x=0, y=0)
    @board = board
    @x = x
    @y = y
    board.cells << self
  end

  def neighbors
    @neighbors = []
    board.cells.each do |cell| 
      #detect a neighbor to the north
      if self.x == cell.x && self.y == cell.y - 1
        @neighbors << cell
      end

      #detect a neighbor to the northeast
      if self.x == cell.x - 1 && self.y == cell.y - 1
        @neighbors << cell
      end

      #detect a neighbor to the southwest
      if self.x == cell.x + 1 && self.y == cell.y + 1
        @neighbors << cell
      end

      #detect a neighbor to the southeast
      if self.x == cell.x - 1 && self.y == cell.y + 1
        @neighbors << cell
      end
      
      #detect a neighbor to the south
      if self.x == cell.x && self.y == cell.y + 1
        @neighbors << cell
      end

      #detect a neighbor to the northwest
      if self.x == cell.x + 1 && self.y == cell.y - 1
        @neighbors << cell
      end

      #detect a neighbor to the west
      if self.x == cell.x + 1 && self.y == cell.y
        @neighbors << cell
      end

      #detect a neighbor to the east
      if self.x == cell.x - 1 && self.y == cell.y
        @neighbors << cell
      end

    end
    @neighbors
  end
end
