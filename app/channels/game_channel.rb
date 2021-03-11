class GameChannel < ApplicationCable::Channel
  def subscribed
    game = BingoHall.find(params[:bingo_hall_id])
    stream_for game
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  # def receive(data)
  #   ActionCable.server.broadcast("#{params[:bingo_hall_id]}", data)
  # end
end
