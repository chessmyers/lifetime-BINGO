class BingoBoardsController < ApplicationController
  POSSIBLE_BINGOS = [[0, 1, 2], [0, 3, 6], [0, 4, 8], [1, 4, 7], [2, 5, 8], [2, 4, 6], [3, 4, 5], [6, 7, 8]].freeze

  def create
  end

  def update
    current_player.bingo_board.update(marked_squares: marked_squares << params[:position])
    bingo = if current_player.bingo_board.marked_squares.count >= 3
              check_for_bingo
            else
              false
            end
  end

  def check_for_bingo
    marked_squares = current_player.bingo_board.marked_squares
    bingo = match_possibilities.each do |match|
      true if marked_squares.include?(match)
    end

  end
end

#
# if bingo_
