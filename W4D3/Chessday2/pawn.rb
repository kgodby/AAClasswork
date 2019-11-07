require_relative 'piece'

class Pawn < Piece

    def initialize(color, board, pos)
      super
    end

    def symbol
      :P
    end

    def move_dirs

      if color == 'black' && at_start_row?
        return [[1,0], [2,0]] + self.side_attacks
      elsif color == 'white' && at_start_row?
        return [[-1,0], [-2,0]] + self.side_attacks
      end
      
      if color == 'black'
        return [1,0] + self.side_attacks
      else
        return [-1,0] + self.side_attacks
      end    
    
    end

    def at_start_row?
      x = pos[0]
      return true if x == 1 || x == 6
      false
    end

    # def forward_dir

    # end

    def side_attacks
      x,y = pos

      if color == 'black'
        
        left = [x + 1, y - 1]
        right = [x + 1, y + 1]
        possible_moves = []
        
        if board.valid_pos?(left) && board[left].color == 'white'
          possible_moves << left
        end 
        
        if  board.valid_pos?(right) && board[left].color == 'white' 
          possible_moves << right
        end
        
        return possible_moves
      end

      if color == 'white'
        
        left = [x - 1, y - 1]
        right = [x - 1, y + 1]
        possible_moves = []
        
        if  board.valid_pos?(left) && board[left].color == 'black'
          possible_moves << left
        end

        if  board.valid_pos?(right) && board[right].color == 'black'
          possible_moves << right
        end
        
        return possible_moves
    end
  end

end