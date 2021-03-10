class BingoBoard < ApplicationRecord
  belongs_to :bingo_hall
  has_one :player
end
