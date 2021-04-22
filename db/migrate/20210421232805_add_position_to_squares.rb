class AddPositionToSquares < ActiveRecord::Migration[6.1]
  def change
    add_column :squares, :position, :integer
  end
end
