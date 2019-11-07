require_relative 'stepable'
require_relative 'piece'

class King < Piece
  include Stepable

  def initialize(color, board, pos)
    super
  end

  def symbol
    :K
  end

  def move_diffs
    STEP_DIRS
  end

  private
  STEP_DIRS = [[1,0], [-1,0], [0,1], [0,-1],[-1,1], [1,1], [-1, -1], [1, -1]]
end