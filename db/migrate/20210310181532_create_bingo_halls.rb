class CreateBingoHalls < ActiveRecord::Migration[6.1]
  def change
    create_table :bingo_halls do |t|
      t.string :name

      t.timestamps
    end
  end
end
