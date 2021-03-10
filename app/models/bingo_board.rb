class BingoBoard < ApplicationRecord
  belongs_to :bingo_hall
  has_one :player
  has_many :squares

  after_create :generate_squares

  def generate_squares
    9.times do |num|
      self.squares.create(text: "#{num} text")
    end
  end
end
