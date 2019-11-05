require_relative 'tic_tac_toe'
require 'byebug'

class TicTacToeNode
  MARKS = [ :x, :o ] 
  attr_reader :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    #  if the @board.winner is the other mark 
    self.children.each { |child| return true if child.board.winner != evaluator }
    return false
  end

  def winning_node?(evaluator)
    #  @board.winner = our own mark
    @board.winner == evaluator
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    child = []
    @board.rows.each_with_index do |row, i|
      row.each_with_index do |pos, j|
        if pos.nil?
          new_board = @board.dup
          new_board[[i, j]] = @next_mover_mark
          if @next_mover_mark == :x 
            next_mark = MARKS[1]
          else
            next_mark = MARKS[0]
          end
          child << TicTacToeNode.new(new_board, next_mark, [i, j])
        end
      end
    end
    child
  end
end
