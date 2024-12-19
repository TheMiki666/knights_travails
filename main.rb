require_relative "lib/board"
board = ChessBoard.new

puts "Testing knight moves"
#Impossible squares (already tested in test1)
p board.knight_moves([0,-1], [0,0])
p board.knight_moves([7,4], [8,4])

# 0 moves
p board.knight_moves([0,0], [0,0])
p board.knight_moves([7,4], [7,4])
p board.knight_moves([2,5], [2,5])

# 1 move
p board.knight_moves([7,7], [6,5])
p board.knight_moves([4,3], [2,4])
p board.knight_moves([3,7], [5,6])

# 2 moves
p board.knight_moves([4,3], [3,4])
p board.knight_moves([0,6], [1,7])
p board.knight_moves([0,2], [0,6])
p board.knight_moves([3,3], [6,6])
p board.knight_moves([2,5], [6,3])
p board.knight_moves([3,1], [5,1])

# 3 moves
p board.knight_moves([3,3], [3,4])
p board.knight_moves([0,1], [5,5])
p board.knight_moves([7,0], [4,6])
p board.knight_moves([0,7], [6,6])

# 4 moves
p board.knight_moves([2,5], [4,3])
p board.knight_moves([0,0], [1,1])
p board.knight_moves([0,0], [6,6])

# 5 moves
p board.knight_moves([7,7], [3,0])
p board.knight_moves([0,0], [6,7])

# 6 moves
p board.knight_moves([7,0], [0,7])
p board.knight_moves([0,0], [7,7])

#THE METHOD WORKS!!!