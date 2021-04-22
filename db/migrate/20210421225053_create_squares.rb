class CreateSquares < ActiveRecord::Migration[6.1]
  def change
    create_table :squares do |t|
      t.string :phrase
      t.belongs_to :bingo_board, foreign_key: true
      t.timestamps
    end
  end
end
