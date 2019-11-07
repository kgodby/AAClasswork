module Slideable

  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end
  
  def moves
    
    possible_moves = []
    directions = move_dirs
    
    directions.each do |step|
      moves_par_dir = grow_unblocked_moves_in_dir(step[0],step[1])
      possible_moves += moves_par_dir
    end
    
    possible_moves
  end

private
  HORIZONTAL_DIRS = [[1,0], [-1,0], [0,1], [0,-1]]
  DIAGONAL_DIRS = [[-1,1], [1,1], [-1, -1], [1, -1]]
  
  def move_dirs
    raise "Implement this method in your class."
  end

  def grow_unblocked_moves_in_dir(dx,dy)
    dir_pos = []
    x,y = pos
    x += dx
    y += dy
     until !board.valid_pos?([x,y]) || !board[[x,y]].nil? 
        dir_pos << [x,y]
         x += dx
         y += dy
     end
      
     dir_pos << [x,y] if board.valid_pos?([x,y]) && board[[x,y]].color != self.color 
     return dir_pos
    end






#valid_directions = call piece.mov_dir (horiz, diag, both)
      #valid_directions.each |dir|
      #dx, dy = dir 
      #x,y = self.pos
      
          #until !x.between?(0..7) or !y.between?(0..7) or pos.occupied
       
          #possible_pos << [x+dx, y+dy]
          #y += dy
          #x += dx
          #end
          # if board[x+dx, y+dy].color != self.color
              #possible_pos << [x+dx, y+dy]
            #end
      #end
      #return possible_pos






  

end