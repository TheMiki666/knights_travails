require_relative "lib/board"
board = ChessBoard.new

#Testing copy
sq = ChessBoard::Square.new(4,4) 
p sq #ok

nsq = sq.copy
p nsq #ok

#Testing add_step
p path=board.initiate_path(0,0) #ok
new_path=path.copy
p new_path #ok
p path.give_way #ok
new_paths = path.add_step(board)
p new_paths
new_paths.each {|x| p x.give_way} #ok
another_paths = new_paths[0].add_step(board)
another_paths.each {|x| p x.give_way} #ok
more_paths = another_paths[4].add_step(board)
more_paths.each {|x| p x.give_way} #ok
i_love_paths = more_paths[1].add_step(board)
i_love_paths.each {|x| p x.give_way} #ok
fancy_paths = i_love_paths[4].add_step(board)
fancy_paths.each {|x| p x.give_way} #PERFECT! It doesn't repeat visited squares!!
puts "-----------------------"
puts "Testing propagate paths"
path=board.initiate_path(0,0)
p path.give_way
puts "----"
m1 = [path]
m2 = board.propagate_paths(m1)
m2.each {|x| p x.give_way} #ok
p m2.size
puts "----"
m3 = board.propagate_paths(m2)
m3.each {|x| p x.give_way} #ok
p m3.size
puts "----"
m4 = board.propagate_paths(m3)
m4.each {|x| p x.give_way} #ok
p m4.size
puts "----"
m5 = board.propagate_paths(m4)
m5.each {|x| p x.give_way} #ok
p m5.size
puts "----"
m6 = board.propagate_paths(m5)
m6.each {|x| p x.give_way} #ok
p m6.size
puts "----"
puts "-----------------------"
puts "Testing propagate paths"
path=board.initiate_path(4,4)
p path.give_way
puts "----"
m1 = [path]
m2 = board.propagate_paths(m1)
m2.each {|x| p x.give_way} #ok
p m2.size
puts "----"
m3 = board.propagate_paths(m2)
m3.each {|x| p x.give_way} #ok
p m3.size
puts "----"
m4 = board.propagate_paths(m3)
m4.each {|x| p x.give_way} #ok
p m4.size
puts "----"
m5 = board.propagate_paths(m4)
# m5.each {|x| p x.give_way} #ok
p m5.size
puts "----"
m6 = board.propagate_paths(m5)
# m6.each {|x| p x.give_way} #ok
p m6.size
puts "----"

