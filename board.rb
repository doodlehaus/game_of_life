class Board

  attr_accessor :cells
  def initialize(grid=5)
    @cells = []
    @fate = []
    @grid = grid
  end

  def tick!
    cells.each do |cell|
      # Any live cell with fewer than two live neighbours dies, as if caused by under-population.
      if cell.neighbors.count < 2
        @cells -= [cell]
      end

      if cell.neighbors.count > 3
        @cells -= [cell]
      end
    end

    (0..@grid-1).each do |x|
      (0..@grid-1).each do |y|
        unless cell_at?(x,y)
          empty_cell = Cell.new(self, x, y)
          puts "empty_cell at #{x}, #{y} has #{empty_cell.neighbors.count} neighbors"
          unless empty_cell.neighbors.count == 3
            self.cells -= [empty_cell]
          end
        end
      end
    end

  end

  def cell_at?(x, y)
    !cells.select{ |c| c.x == x && c.y == y }.empty?
  end

end
