class BingoBoardsController < ApplicationController

  def update
    board = BingoBoard.find(params[:id])
    puts "****** HELLO FROM #{board.player.name}"
ActionCable.server.broadcast(board.bingo_hall, { board_id: board.id})
  end
end
