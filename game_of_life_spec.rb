require_relative './game_of_life'
require_relative './board'

describe "Conway's Game of Life:" do

  #Any live cell with fewer than two live neighbours dies, as if caused by under-population.
  #Any live cell with two or three live neighbours lives on to the next generation.
  #Any live cell with more than three live neighbours dies, as if by overcrowding.
  #Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.
  #
  # Notes from the Ryan Bigg live coding screencast
  # 1) Cells are initialized into a world and with x and y coordinates
  # 2) Cells detect their neighbors
  # 3) The World class maintains the collection of only live cells
  # 4) for every world.tick! rules are applied
  # 5) Cells can determine if they're dead (they look for themselves in the world object
  
  describe "Cell" do
    let(:cell) { Cell.new(true, 0, 0) }

    it '.neighbors' do
      cell.respond_to?(:neighbors).should be_true
    end

    it 'has neighbors' do
      cell.neighbors.count.should == 8
    end
  
    describe "Any live cell with fewer than two live neighbours" do
      let(:cell) { Cell.new(true, 0, 0) }
      let(:board) { Board.new }
      let(:board_next) { Board.new }

      it 'dies, as if caused by under-population.' do
        cell.dead?.should be_true
      end
    end
  end

  describe "Board" do

    let(:board) { Board.new(12, 10, [[1,1],[2,2],[3,3]] ) }

    
  end
  
end
