class CreateSquares < ActiveRecord::Migration[6.1]
  def change
    create_table :squares do |t|
      t.boolean :clicked, default: false
      t.belongs_to :bingo_board
      t.string :text
      t.timestamps
    end
  end
end
