require_relative '../spec_helper'

RSpec.describe BingoHallsController do

  describe '#create' do
    it 'redirects the user to the newly created bingo hall' do
      post :create, params: { name: 'My cool hall' }
      expect(response).to be_redirect
    end
  end
end