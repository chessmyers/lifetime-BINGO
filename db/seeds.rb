# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

furby_hall = BingoHall.create(name: 'Furbyverse')
pokemon_hall = BingoHall.create(name: 'Pokédex')

['Pikachu', 'Bulbasaur', 'Gengar', 'Ditto'].each_with_index do |player, idx|
  bingo_board = pokemon_hall.bingo_boards.create
  Player.create(name: player, bingo_board: bingo_board)
end

['Long Furby', 'Chonky Furby', 'Cursed Furby', 'Supreme Ruler Furby'].each_with_index do |player, idx|
  bingo_board = furby_hall.bingo_boards.create
  Player.create(name: player, bingo_board: bingo_board)
end
