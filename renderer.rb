class Renderer

  def initialize(board)
    @board = board
  end

  def render
    output = ""
    (0..@board.grid-1).each do |x|
      (0..@board.grid-1).each do |y|
        if @board.cell_at?(x,y)
          output += '0'
        else
          output += '-'
        end
      end
      output += "\n"
    end
    output
  end
  
  def clear
    print "\e[2J\e[f"
  end

  
  # See http://stackoverflow.com/questions/2336474/in-place-progress-output-in-the-terminal-or-console
  # for info on how to render to the console
  # 10.times{|i| STDOUT.write "\r#{i}"; sleep 1}
  #
  # generations.times{|i| STDOUT.write "\r#{output};sleep 1}

end
