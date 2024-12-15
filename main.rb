require_relative "lib/board"

board = ChessBoard.new

#Testing get_joints
#Impossible squares
p board.get_joints(8,4)
p board.get_joints(4,9)
p board.get_joints(-1,4)
p board.get_joints(4,-3)

#corners
p board.get_joints(7,7)
p board.get_joints(0,0)
p board.get_joints(7,0)
p board.get_joints(0,7)

#near corners
p board.get_joints(6,0)
p board.get_joints(6,7)

#sides 
p board.get_joints(0,3)
p board.get_joints(4,7)

#near sides
p board.get_joints(2,1)
p board.get_joints(6,3)

#center
p board.get_joints(4,4)
p board.get_joints(4,3)

#ALL CORRECT

#Testing knight_moves input filter
p board.knight_moves([0,0],nil)
p board.knight_moves([0,0],"cow")
p board.knight_moves([0,0],["cow"])
p board.knight_moves([0,0],["cow, chicken"])
p board.knight_moves([0,0],[nil, nil])
p board.knight_moves([0,0],[1])
p board.knight_moves([0,0],[1,1,1])
p board.knight_moves([0,0],[1,8])
p board.knight_moves([0,0],[-1,0])
p board.knight_moves([0,0],[0,0])
p board.knight_moves(nil,[7,7])
p board.knight_moves("cow",[7,7])
p board.knight_moves(["cow"],[7,7])
p board.knight_moves(["cow, chicken"],[7,7])
p board.knight_moves([nil, nil],[7,7])
p board.knight_moves([1],[7,7])
p board.knight_moves([1,1,1],[7,7])
p board.knight_moves([1,8],[7,7])
p board.knight_moves([-1,0],[7,7])
p board.knight_moves([0,0],[7,7])