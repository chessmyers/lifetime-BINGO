class Square < ApplicationRecord
  belongs_to :bingo_board, dependent: :destroy
  validates_uniqueness_of :phrase
end
