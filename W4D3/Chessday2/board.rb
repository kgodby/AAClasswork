
require_relative "piece"
require 'byebug'
class Board
attr_reader :grid
  def initialize
    @grid = Array.new(8) {Array.new(8, NullPiece.instance) }
  end

  def add_piece(piece,pos)
    @grid[pos] = piece
  end
  
  
  def valid_pos?(pos)
    x,y = pos
    x.between?(0,7) && y.between?(0,7)
  end

  def move_piece(start_pos, end_pos)
    row,col = start_pos
    x,y = end_pos
    if @grid[row][col].nil?
      raise 'No piece at the entered position'
    else 
      if !@grid[x][y].nil?
      raise "space is occupied"
      end
    end
    piece = @grid[row][col]
    @grid[row][col] = nil
    @grid[x][y] = piece 
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos,val)
    row, col = pos
    @grid[row][col] = val
  end


  def print_grid

    @grid.each  do |row|
      temp = []
      row.each do |pos|
        if pos.nil?
          str = "N"
        else
          str = "P"
        end
        temp << str
      end
      print temp
      puts
    end
  end

end