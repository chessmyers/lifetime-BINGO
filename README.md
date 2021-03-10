# Lifetime BINGO!


## Game Creator flow --> Go to game creation page --> Input name for hall --> Creates a new BingoHall

## Player Flow:
    - Player enters game --> Bingo board generated --> Squares generated to fill it in

## Modles

BingoHall -- scaffold
- has_many players
- has_one creator

name --> string


BingoBoard -- resources
- has_many BingoSquare
- has_one player

BingoSquare -- model
 - belongs_to BingoBoard
 - 

checked? -- boolean
text -- string