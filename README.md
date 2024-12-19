# Knights Travails
Exercise Knights Travails from the Ruby course of The Odin Project

https://www.theodinproject.com/lessons/ruby-knights-travails

# Assignment
Your task is to build a function knight_moves that shows the shortest possible way to get from one square to another by outputting all squares the knight will stop on along the way.

You can think of the board as having 2-dimensional coordinates. Your function would therefore look like:

knight_moves([0,0],[1,2]) == [[0,0],[1,2]]

Sometimes there is more than one fastest path. Examples of this are shown below. Any answer is correct as long as it follows the rules and gives the shortest possible path.

knight_moves([0,0],[3,3]) == [[0,0],[2,1],[3,3]] or knight_moves([0,0],[3,3]) == [[0,0],[1,2],[3,3]]

# Solution

The algorithm I used is not efficient, since it uses a bit of brute force; but the number of squares on a chessboard is small, and the maximum number of calculations to be performed is not very high.
Starting from the starting square, the algorithm calculates all the possible paths of a single knight's jump. If none of them ends on the arrival square, it takes these possible paths and expands them one more square, calculating all the possible two-step paths (without passing through squares already visited). And so on until reaching the starting square. In the worst case (from corner to opposite corner), the longest path will have six steps, and will require about 3600 iterations (I used a counter to check this).
