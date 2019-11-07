module Stepable

  def moves
    possible_moves = []
    x,y = pos
    directions = move_diffs

    directions.each do |step|
      dx, dy = step
      
      next_pos = [x + dx, y + dy]
      
      if (board.valid_pos?(next_pos) && board[next_pos].class == NullPiece) || (board.valid_pos?(next_pos) && board[next_pos].color != self.color)
        possible_moves << next_pos
      end
    end
      return possible_moves
  end

  def move_diffs
    raise "Implement this method in class."
  end

end