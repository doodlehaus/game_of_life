require_relative './cell'
require_relative './board'

describe "Conway's Game of Life:" do

  #Any live cell with fewer than two live neighbours dies, as if caused by under-population.
  #Any live cell with two or three live neighbours lives on to the next generation.
  #Any live cell with more than three live neighbours dies, as if by overcrowding.
  #Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.
  #
  # Notes from the Ryan Bigg live coding screencast
  # 1) Cells are initialized into a board and with x and y coordinates
  # 2) Cells detect their neighbors
  # 3) The Board class maintains the collection of only live cells
  # 4) for every board.tick! rules are applied
  # 5) Cells can determine if they're dead (they look for themselves in the board object

  describe "board utility methods" do
    before do
      @board = Board.new(9)
    end

    it 'should detect occupied grid points' do
      cell = Cell.new(@board, 0, 0)
      @board.cell_at?(0,0).should be_true
    end

    it 'should detect empty grid points' do
      @board.cell_at?(0,0).should be_false
    end

    it 'should detect occupied grid points' do
      cell = Cell.new(@board)
      @board.cell_at?(0,0).should be_true
    end
    
  end
  
  describe 'cell utility methods' do
    before do
      @board = Board.new
      @cell = Cell.new(@board)
    end

    it 'detects a neighbor to the north' do
      n_cell = Cell.new(@board, 0, 1)
      @cell.neighbors.count.should == 1
    end

    it 'detects a neighbor to the northeast' do
      ne_cell = Cell.new(@board, 1, 1)
      @cell.neighbors.count.should == 1
    end

    it 'detects a neighbor to the southwest' do
      sw_cell = Cell.new(@board, -1, -1)
      @cell.neighbors.count.should == 1
    end

    it 'detects a neighbor to the northwest' do
      nw_cell = Cell.new(@board, -1, 1)
      @cell.neighbors.count.should == 1
    end

    it 'detects a neighbor to the west' do
      w_cell = Cell.new(@board, -1, 0)
      @cell.neighbors.count.should == 1
    end

    it 'detects a neighbor to the east' do
      e_cell = Cell.new(@board, 1, 0)
      @cell.neighbors.count.should == 1
    end
    
    it 'detects a neighbor to the southeast' do
      se_cell = Cell.new(@board, 1, -1)
      @cell.neighbors.count.should == 1
    end

    it 'detects a neighbor to the south' do
      s_cell = Cell.new(@board, 0, -1)
      @cell.neighbors.count.should == 1
    end
  end
 
  describe "rules" do
    describe "Any live cell with fewer than two live neighbors dies, as if caused by under-population" do
      before do
        @board = Board.new
        @cell = Cell.new(@board)
      end
      it 'zero neighbors' do
        distant_cell = Cell.new(@board, 0, 3)
        @cell.neighbors.count.should == 0
        @board.tick!
        @board.cells.include?(@cell).should be_false
      end

      it 'one neighbor' do
        n_cell = Cell.new(@board, 0, 1)
        @cell.neighbors.count.should == 1
        @board.tick!
        @board.cells.include?(@cell).should be_false
      end
    end

    describe "Any live cell with two or three live neighbours lives on to the next generation." do
        before do
          @board = Board.new
          @cell = Cell.new(@board)
        end

        it 'two neighbors' do
          ne_cell = Cell.new(@board, 1, 1)
          sw_cell = Cell.new(@board, -1, -1)
          @cell.neighbors.count.should == 2
          @board.tick!
          @board.cells.include?(@cell).should be_true
        end

        it 'three neighbors' do
          nw_cell = Cell.new(@board, -1, 1)
          w_cell = Cell.new(@board, -1, 0)
          e_cell = Cell.new(@board, 1, 0)
          @cell.neighbors.count.should == 3
          @board.tick!
          @board.cells.include?(@cell).should be_true
        end
    end

    describe "Any live cell with more than three live neighbours dies, as if by overcrowding." do
      before do
        @board = Board.new
        @cell = Cell.new(@board)
      end

      it 'four neighbors' do
        s_cell = Cell.new(@board, 0, -1)
        sw_cell = Cell.new(@board, 1, -1)
        nw_cell = Cell.new(@board, -1, 1)
        w_cell = Cell.new(@board, -1, 0)
        @cell.neighbors.count.should == 4
        @board.tick!
        @board.cells.include?(@cell).should be_false
      end
    end

    describe "Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction." do
      before do
        @board = Board.new(9)
      end

      it 'dead cell with two neighbors' do
        e_cell = Cell.new(@board, 1, 0)
        ne_cell = Cell.new(@board, 1, 1)
        @board.cell_at?(0,0).should be_false
        @board.tick!
        @board.cell_at?(0,0).should be_false 
      end

      it 'dead cell with three neighbors' do
        n_cell = Cell.new(@board, 0, 1)
        e_cell = Cell.new(@board, 1, 0)
        ne_cell = Cell.new(@board, 1, 1)
        @board.cell_at?(0,0).should be_false
        @board.tick!
        @board.cell_at?(0,0).should be_true
      end

      it 'dead cell with four neighbors' do
        # test empty cell at (1,0)
        n_cell = Cell.new(@board, 1, 1)
        e_cell = Cell.new(@board, 2, 0)
        w_cell = Cell.new(@board, 0, 0)
        ne_cell = Cell.new(@board, 2, 1)
        @board.cell_at?(1,0).should be_false
        @board.tick!
        @board.cell_at?(1,0).should be_false
      end
    end
  end

end
