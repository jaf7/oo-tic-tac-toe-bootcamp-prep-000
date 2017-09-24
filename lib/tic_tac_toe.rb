class TicTacToe
  def initialize(board = nil)
   @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input_integer = input.to_i
    index = input_integer - 1
  end

  def move(index, char)
    @board[index] = char
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ") # NilClass public instance method, nil? -> true
  end

  def valid_move?(index)
    if !position_taken?(index)
      if index.between?(0,8)
        true
      else
        false
      end
    else
      false
    end
  end

  def turn_count
    turns = 0
    @board.each do |token|
      if token != "" && token != " " && token != nil
        turns += 1
      end
    end
    turns
  end

  def current_player
    turns = turn_count # self.turn_count ?
    turns % 2 == 0 ? player = "X" : player = "O"
    player
  end

end
