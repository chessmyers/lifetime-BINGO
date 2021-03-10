class AddAssociationBetweenBingoHallandBingoGame < ActiveRecord::Migration[6.1]
  def change
    add_reference(:bingo_boards, :bingo_hall, foreign_key: true)
  end
end
