class Square < ApplicationRecord
  belongs_to :bingo_board, dependent: delete_all
  validates_uniqueness_of :phrase
end
