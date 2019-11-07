
require_relative 'slideable'
require_relative 'piece'
class Bishop < Piece

include Slideable
  
  def initialize(color, board, pos)
    super
  end

  def symbol
    :B
  end

  def move_dirs
    diagonal_dirs
  end

end