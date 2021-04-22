class Player < ApplicationRecord
  belongs_to :bingo_board, dependent: delete
end
