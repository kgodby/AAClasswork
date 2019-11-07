require_relative 'board'
class Piece
  attr_reader :pos, :board, :color
  def initialize(color, board, pos)
    @pos = pos
    @color = color
    @board = board
  end

  def to_s
    p symbol.to_s
  end

  def empty?
    @board[@pos].empty?
  end

  def valid_moves
    
  end

  def pos=(val)
  
  @board[@pos] = val
  end

  # def symbol
    
  # end

  private
  def move_into_check?(end_pos)
    
  end

end