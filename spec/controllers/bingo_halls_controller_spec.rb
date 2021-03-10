require 'rails_helper'

RSpec.describe BingoHallsController, type: :controller do

  describe '#create' do
    it 'redirects the user to the newly created bingo hall' do
      post :create, params: {bingo_hall: { name: 'My cool hall' }}
      expect(response).to be_redirect
    end

    it 'creates a new bingo board' do
      expect{ post :create, params: {bingo_hall: { name: 'furb' }}}.to change{BingoBoard.count}.by(1) & change{Player.count}.by(1)
      bingo_hall = BingoHall.last
      expect(BingoBoard.last.bingo_hall).to eq bingo_hall
      expect(Player.last.bingo_board).to eq bingo_hall.bingo_boards.last
      expect(bingo_hall.bingo_boards.last.player).to eq Player.last
    end
  end
end
