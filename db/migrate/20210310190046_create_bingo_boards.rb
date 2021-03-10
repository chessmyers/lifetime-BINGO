class CreateBingoBoards < ActiveRecord::Migration[6.1]
  def change
    create_table :bingo_boards do |t|

      t.timestamps
    end
  end
end
