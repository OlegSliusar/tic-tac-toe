class TicTacToe
  attr_accessor :players_turn

  def initialize
    @players_turn = rand(2)
    @players_turn = "X" if @players_turn == 0
    @players_turn = "O" if @players_turn == 1
    @board = []
    puts "Player #{@players_turn} starts the game..."
  end

  def show_current_board
    counter_three = 0
    puts "\n" + "#" * 23 + "\n"
    puts "     1     2     3"
    9.times do |i|
      case i
      when 0
        print " a  "
      when 3
        print " b  "
      when 6
        print " c  "
      else
        print ""
      end
      if @board[i].nil?
        print " " * 3
      else
        print " #{@board[i]} "
      end
      print " | " unless counter_three == 2
      counter_three += 1
      if counter_three == 3
        print "\n"
        puts "   " + "-" * 17 unless i > 6
        counter_three = 0
      end
    end
    puts "\n" + "#" * 23 + "\n"
  end

  def move(input)
    input = input.strip.downcase.scan(/\w/).join
    return_block = Proc.new do |index|
      return puts "The place is taken. Choose another one..." unless @board[index].nil?
      @board[index] ||= @players_turn
    end

    case input
    when "a1", "1a"
      return_block.call(0)
    when "a2", "2a"
      return_block.call(1)
    when "a3", "3a"
      return_block.call(2)
    when "b1", "1b"
      return_block.call(3)
    when "b2", "2b"
      return_block.call(4)
    when "b3", "3b"
      return_block.call(5)
    when "c1", "1c"
      return_block.call(6)
    when "c2", "2c"
      return_block.call(7)
    when "c3", "3c"
      return_block.call(8)
    else
      return puts "Wrong command."
    end
    swap_players
  end

  def swap_players
    if @players_turn == "O"
      @players_turn = "X"
    elsif @players_turn == "X"
      @players_turn = "O"
    end
  end

  def victory

    # Horizontal
    if @board[0] && @board[0] == @board[1] && @board[1] == @board[2]
      @board[0]
    elsif @board[3] && @board[3] == @board[4] && @board[4] == @board[5]
      @board[3]
    elsif @board[6] && @board[6] == @board[7] && @board[7] == @board[8]
      @board[6]
    # Vertical
    elsif @board[0] && @board[0] == @board[3] && @board[3] == @board[6]
      @board[0]
    elsif @board[1] && @board[1] == @board[4] && @board[4] == @board[7]
      @board[1]
    elsif @board[2] && @board[2] == @board[5] && @board[5] == @board[8]
      @board[2]
    # Diagonal
    elsif @board[0] && @board[0] == @board[4] && @board[4] == @board[8]
      @board[0]
    elsif @board[2] && @board[2] == @board[4] && @board[4] == @board[6]
      @board[2]
    elsif @board.compact.length == 9
      "Draw!"
    end

    # for_player = "X"
    # winner = check_block.call
    # return winner if winner
    # for_player = "O"
    # check_block.call(for_player)
  end
end
