class BingoBoardsController < ApplicationController

  def click(board_id, square_id)
    board = BingoBoard.find board_id
    ActionCable.server.broadcast(board.bingo_hall, { board_id: board_id, square_id: square_id })
  end
end
