class AddMarkedSquaresToBingoBoard < ActiveRecord::Migration[6.1]
  def change
    add_column :bingo_boards, :marked_squares, :integer, array: true
  end
end
