class Cell

  attr_accessor :neighbors, :alive
  attr_reader :x, :y
  def initialize(alive=false, x=1, y=1)
    @alive = alive
    @x = x
    @y = y
    @neighbors = []
    add_neighbors
  end

  # seems like the game or board should keep track of neighbors
  # doesn't make sense for the cell to keep track of its neighbors
  def add_neighbors
      @neighbors << [@x, @y + 1]
      @neighbors << [@x, @y - 1]
      @neighbors << [@x + 1, @y]
      @neighbors << [@x + 1, @y - 1]
      @neighbors << [@x + 1, @y + 1]
      @neighbors << [@x - 1, @y]
      @neighbors << [@x - 1, @y - 1]
      @neighbors << [@x - 1, @y + 1]
  end

  def dead?
    @alive == false
  end

  def alive?
    @alive == true
  end

  def resurrect!
    @alive = true
  end

  def kill!
    @alive = false
  end

  # currently, this method is too tightly coupled to the board (at least I think it is)
  def live_neighbors
    @neighbors.select{|n| b.cell(n[0], n[1]).alive == true}.count #this gets the count but isn't correctly implemented
  end

  # does this logic belong in the Cell class? Probably should be part of the game class
  def check_live_cell
      case live_neighbors
      when live_neighbors < 2
        kill!
      when live_neighbors > 3
        kill!
      end
  end

  # does this logic belong in the Cell class? Probably should be part of the game class
  def check_dead_cell
    if live_neighbors == 3
      resurrect!
    end
  end

  # does this logic belong in the Cell class? Probably should be part of the game class
  def check_fate
    if alive?
      check_live_cell
    else
      check_dead_cell
    end
  end

end
