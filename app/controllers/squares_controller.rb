class SquaresController < ApplicationController
  def update
    square = Square.find(params[:id])
    board = square.bingo_board
    old_value = square.clicked
    square.update(clicked: !old_value, text: "#{!old_value}")
    cookies[:player_id] = { value: board.player.id }
    ActionCable.server.broadcast(board.bingo_hall.id, { board_id: board.id })
    redirect_to bingo_hall_path(id: board.bingo_hall.id)
  end
end
