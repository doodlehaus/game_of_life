class Board

  attr_accessor :cells
  attr_reader :grid
  def initialize(grid=5)
    @cells = []
    @fate = []
    @grid = grid
  end

  def tick!
    # check live cells
    cells.each do |cell|
      if cell.neighbors.count == 3 || cell.neighbors.count == 2
        @fate << cell
      end
    end


    # check empty grid spaces
    (0..@grid-1).each do |x|
      (0..@grid-1).each do |y|
        unless cell_at?(x,y)
          empty_cell = Cell.new(self, x, y)
          if empty_cell.neighbors.count == 3
            @fate << empty_cell
          end
          self.cells -= [empty_cell]
        end
      end
    end

    @cells = @fate
    @fate = []

  end

  def cell_at?(x, y)
    !cells.select{ |c| c.x == x && c.y == y }.empty?
  end

end
