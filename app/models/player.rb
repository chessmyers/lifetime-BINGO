class Player < ApplicationRecord
  def bingo_board
    BingoBoard.where(player_id: id)
  end
end
