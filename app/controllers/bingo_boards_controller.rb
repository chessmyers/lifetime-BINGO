class BingoBoardsController < ApplicationController

  def update
    board = BingoBoard.find(params[:id])
    cookies[:player_id] = { value: board.player.id }
    ActionCable.server.broadcast(board.bingo_hall.id, { board_id: board.id })
    redirect_to bingo_hall_path(id: board.bingo_hall.id)
  end
end
