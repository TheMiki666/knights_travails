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

