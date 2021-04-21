class PlayersController < ApplicationController
  def new
    @player = Player.new
    @bingo_hall_id = params[:bingo_hall_id]
  end

  def create
    bingo_hall = BingoHall.find(params[:player][:bingo_hall_id])
    bingo_board = bingo_hall.bingo_boards.create
    player = Player.create(name: params[:name], bingo_board: bingo_board)
    cookies[:player_id] = player.id
    redirect_to bingo_hall_path(id: bingo_hall.id)
  end
end
