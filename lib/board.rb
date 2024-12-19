class ChessBoard
  MIN_SIZE = 0
  MAX_SIZE = 7

  class Square

    attr_reader :joint_squares, :row, :col
    
    def initialize(r,c)
      @row = r
      @col = c
      @joint_squares = find_joints
    end

    def copy
      Square.new(@row, @col)
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

  class Path
    attr_accessor :way
    
    def initialize
      clear
    end
  
    def clear
      @way = []
    end

    def copy
      new_path = Path.new
      @way.each {|square| new_path.way.push(square.copy)}
      new_path
    end

    def add_square(square)
      @way.push(square)
    end

    def give_way
      output = []
        @way.each {|square| output.push([square.row, square.col])}
      output
    end

    def get_last_square
      @way[@way.size - 1]
    end

    #Return an array with possible paths with one more step
    def add_step(board)
      last_square = @way[@way.length-1]
      return self if last_square.nil?
      array_of_paths = Array.new
      last_square.joint_squares.each do |coord|
        new_square = board.get_square_object(coord[0], coord[1])
        already_walked = false
        @way.each do |prev_square|
          if prev_square.row == new_square.row &&  prev_square.col == new_square.col 
            already_walked = true
            break
          end 
        end
        if !already_walked
          new_path = self.copy
          new_path.add_square(new_square)
          array_of_paths.push(new_path)
        end
      end
      array_of_paths
    end

  end #of class path

  def initialize
    create_board
  end

  def get_joints(row, col)
    return nil if row < MIN_SIZE || row > MAX_SIZE || col < MIN_SIZE || col > MAX_SIZE
    @board[row][col].joint_squares
  end

  def get_square_object(row, col)
    return nil if row < MIN_SIZE || row > MAX_SIZE || col < MIN_SIZE || col > MAX_SIZE
    @board[row][col]
  end

  def knight_moves(start, ending)
    #Filtering input
    return if !start.is_a?(Array) || !ending.is_a?(Array)
    return if start.size != 2 || ending.size !=2 
    return if !start[0].is_a?(Integer) || !start[1].is_a?(Integer) || !ending[0].is_a?(Integer)|| !ending[1].is_a?(Integer)
    return if start[0] < MIN_SIZE || start[1] < MIN_SIZE || ending[0] < MIN_SIZE || ending[1] < MIN_SIZE
    return if start[0] > MAX_SIZE || start[1] > MAX_SIZE || ending[0] > MAX_SIZE || ending[1] > MAX_SIZE
    # puts "Correct" #Uncomment for testing filtering
    
    path = find_best_path(start, ending)
    path.give_way
  end

  def initiate_path(row, col)
    return nil if row < MIN_SIZE || row > MAX_SIZE || col < MIN_SIZE || col > MAX_SIZE
    path = Path.new
    path.add_square(get_square_object(row,col))
    path
  end

  def propagate_paths(paths_array)
    return nil if paths_array.nil?
    output_paths = Array.new
    paths_array.each do |path|
      output_paths = output_paths + path.add_step(self)
    end
    output_paths
  end
  
  private 

  def find_best_path(start, ending)
    path_array = [initiate_path(start[0],start[1])]
    found = nil
    while found.nil?
      path_array.each do |path| 
        if path.get_last_square.row == ending[0] && path.get_last_square.col == ending[1]
          found = path
          break
        end
      end
      path_array = propagate_paths(path_array) if found.nil?
    end
    found
  end

  def create_board
    size = MAX_SIZE - MIN_SIZE + 1
    @board = Array.new(size){Array.new(size)}
    (MIN_SIZE..MAX_SIZE).each do |r|
      (MIN_SIZE..MAX_SIZE).each do |c|
        @board[r][c] = Square.new(r,c)
      end
    end
  end


end