
require_relative "piece"
require 'byebug'
class Board

  def initialize
    @grid = Array.new(8) {Array.new(8) }
    @grid[0].each_with_index { |pos,idx| @grid[0][idx] = Piece.new }
    @grid[1].each_with_index { |pos,idx| @grid[1][idx] = Piece.new }
    @grid[6].each_with_index { |pos,idx| @grid[6][idx] = Piece.new }
    @grid[7].each_with_index { |pos,idx| @grid[7][idx] = Piece.new }

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