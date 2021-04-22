class BingoBoard < ApplicationRecord
  belongs_to :bingo_hall, dependent: :destroy
  has_one :player
  has_many :squares
end
