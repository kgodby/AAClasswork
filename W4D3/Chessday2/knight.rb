require_relative 'stepable'
require_relative 'piece'

class Knight < Piece

  include Stepable

  def initialize(color, board, pos)
    super
  end

  def symbol
    :Kn
  end

  def move_diffs
    STEP_DIFFS
  end





private
STEP_DIFFS = [ [-2, -1], [-2, 1], [-1, -2], [-1, 2], [1, -2], [1, 2], [2, -1], [2, 1] ]
end