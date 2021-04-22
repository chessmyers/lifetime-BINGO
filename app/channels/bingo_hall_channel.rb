class BingoHallChannel < ApplicationCable::Channel
  def subscribed
    bingo_hall = BingoHall.find(params[:id])
    stream_for bingo_hall
  end

  def unsubscribed
    current_player.bingo_board.destroy!
    current_player.destroy!
  end
end
