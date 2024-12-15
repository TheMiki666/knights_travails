class ChessBoard
  MIN_SIZE = 0
  MAX_SIZE = 7

  class Square

    attr_reader :joint_squares
    
    def initialize(r,c)
      @row = r
      @col = c
      @visited = false
      @joint_squares = find_joints
    end

    private

    def find_joints
      joints = []
      candidates = []
      candidates.push([@row+2, @col+1])
      candidates.push([@row+2, @col-1])
      candidates.push([@row-2, @col+1])
      candidates.push([@row-2, @col-1])
      candidates.push([@row+1, @col+2])
      candidates.push([@row+1, @col-2])
      candidates.push([@row-1, @col+2])
      candidates.push([@row-1, @col-2])

      #Time to filter the candidates
      min = ChessBoard::MIN_SIZE
      max = ChessBoard::MAX_SIZE
      candidates.each do |candidate|
        joints.push(candidate) if candidate[0]>=min && candidate[1]>=min && candidate[0]<=max && candidate[1]<=max
      end
      joints
    end

  end #of class Square

  def initialize
    create_board
  end

  def get_joints(row, col)
    return nil if row < MIN_SIZE || row > MAX_SIZE || col < MIN_SIZE || col > MAX_SIZE
    @board[row][col].joint_squares
  end

  def knight_moves(start, ending)
    #Filtering input
    return if !start.is_a?(Array) || !ending.is_a?(Array)
    return if start.size != 2 || ending.size !=2 
    return if !start[0].is_a?(Integer) || !start[1].is_a?(Integer) || !ending[0].is_a?(Integer)|| !ending[1].is_a?(Integer)
    return if start[0] < MIN_SIZE || start[1] < MIN_SIZE || ending[0] < MIN_SIZE || ending[1] < MIN_SIZE
    return if start[0] > MAX_SIZE || start[1] > MAX_SIZE || ending[0] > MAX_SIZE || ending[1] > MAX_SIZE
    # puts "Correct" #Uncomment for testing filtering
  end
  
  private 

  def create_board
    size = MAX_SIZE - MIN_SIZE + 1
    @board = Array.new(size){Array.new(size)}
    (MIN_SIZE..MAX_SIZE).each do |r|
      (MIN_SIZE..MAX_SIZE).each do |c|
        @board[r][c] = Square.new(r,c)
      end
    end
  end

  def clear
    @board.each do |row|
      row.each {@visited = false}
    end
  end


end