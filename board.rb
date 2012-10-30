class Board

  attr_accessor :cells
  def initialize(grid=5, generations=2, seed=[])
    origin = 1
    max = grid
    @cells = []
    @fate = []
    grid_init(origin, max)
  end

  def grid_init(origin, max)
    (origin..max).each do |x|
      (origin..max).each do |y|
        @cells << Cell.new(false, x, y)
      end
    end
  end

  def cell(x, y)
    @cells.select{|c| c.x == x && c.y == y}.first
  end

  def next_turn
    @cells.each do |c|
      @fate << c.check_fate
    end
  end

end
