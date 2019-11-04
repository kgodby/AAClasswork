require_relative "PolyTreeNode"

class KnightPatherFinder

    MOVES = [ [-2, -1], [-2, 1], [-1, -2], [-1, 2], [1, -2], [1, 2], [2, -1], [2, 1] ]

    def initialize(start)
        @current_pos = start
        @root = PolyTreeNode.new(start)
        @moves = {}  
        @prev_pos = [start]
    end

    def new_move_tree
        new_moves = new_move_pos(@current_pos)
        new_moves.each { |move| @moves[move] = @root } 
        until new_moves.empty?
            current_move = PolyTreeNode.new(new_moves.shift) 
            current_move.parent = @moves[current_move.value] 
            next_move = new_move_pos(current_move.value)
        end
    end

 
    def valid_move?(pos)  
        row, col = pos   
        temp = []
        MOVES.each do |move|
            x, y = move
            if (row + x).between?(0,7) && (col + y).between?(0,7)
                temp << [row + x, col + y]
            end
        end    
        temp
    end

    def new_move_pos(pos)
        new_moves = valid_move?(pos).reject { |el| @prev_pos.include?(el) }
        new_moves.each { |el| @prev_pos << el if !@prev_pos.include?(el) } 
        new_moves # This is the array of all the pos that we can use, never used it before, aka the empty pos.
    end

end
