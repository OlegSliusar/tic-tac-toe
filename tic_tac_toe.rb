class TicTacToe

  def initialize
    @players_move = rand(2)
    @players_move = "X" if @players_move == 0
    @players_move = "O" if @players_move == 1
    @grid = []
    puts "Player #{@players_move} starts the game..."
    play
  end

  def show_current_grid
    counter_three = 0
    puts "\n" + "#" * 20 + "\n"
    puts "     1    2     3"
    9.times do |i|
      case i
      when 0
        print " a "
      when 3
        print " b "
      when 6
        print " c "
      else
        print ""
      end
      if @grid[i].nil?
        print " " * 3
      else
        print " #{@grid[i]} "
      end
      print " | " unless counter_three == 2
      counter_three += 1
      if counter_three == 3
        print "\n"
        puts "   " + "-" * 15 unless i > 6
        counter_three = 0
      end
    end
    puts "\n"
    puts "#" * 20
  end

  def move(input)
    input = input.strip.downcase.scan(/\w/).join
    case input
    when "a1", "1a"
      return puts "The place is taken. Try another one..." unless @grid[0].nil?
      @grid[0] ||= @players_move
    when "a2", "2a"
      return puts "The place is taken. Try another one..." unless @grid[1].nil?
      @grid[1] ||= @players_move
    when "a3", "3a"
      return puts "The place is taken. Try another one..." unless @grid[2].nil?
      @grid[2] ||= @players_move
    when "b1", "1b"
      return puts "The place is taken. Try another one..." unless @grid[3].nil?
      @grid[3] ||= @players_move
    when "b2", "2b"
      return puts "The place is taken. Try another one..." unless @grid[4].nil?
      @grid[4] ||= @players_move
    when "b3", "3b"
      return puts "The place is taken. Try another one..." unless @grid[5].nil?
      @grid[5] ||= @players_move
    when "c1", "1c"
      return puts "The place is taken. Try another one..." unless @grid[6].nil?
      @grid[6] ||= @players_move
    when "c2", "2c"
      return puts "The place is taken. Try another one..." unless @grid[7].nil?
      @grid[7] ||= @players_move
    when "c3", "3c"
      return puts "The place is taken. Try another one..." unless @grid[8].nil?
      @grid[8] ||= @players_move
    else
      return puts "Wrong command."
    end
    swap_players
  end

  def swap_players
    if @players_move == "O"
      @players_move = "X"
    elsif @players_move == "X"
      @players_move = "O"
    end
  end

  def play
    until victory?
      show_current_grid
      print "Player #{@players_move}, enter your move: "
      move(gets)
    end
    show_current_grid
    puts "Player #{victory?} wins!"
    print "\n"
    print "Play again? (y/n) "
    answer = gets.strip
    puts "#" * 90
    initialize if answer == "y"
  end

  def victory?
    str = "X"
    if @grid[0] == str && @grid[1] == str && @grid[2] == str
      return str
    end
    if @grid[3] == str && @grid[4] == str && @grid[5] == str
      return str
    end
    if @grid[6] == str && @grid[7] == str && @grid[8] == str
      return str
    end
    ################
    if @grid[0] == str && @grid[3] == str && @grid[6] == str
      return str
    end
    if @grid[1] == str && @grid[4] == str && @grid[7] == str
      return str
    end
    if @grid[2] == str && @grid[5] == str && @grid[8] == str
      return str
    end
    ################
    if @grid[0] == str && @grid[4] == str && @grid[8] == str
      return str
    end
    if @grid[2] == str && @grid[4] == str && @grid[6] == str
      return str
    end

    #########################################################
    str = "O"
    if @grid[0] == str && @grid[1] == str && @grid[2] == str
      return str
    end
    if @grid[3] == str && @grid[4] == str && @grid[5] == str
      return str
    end
    if @grid[6] == str && @grid[7] == str && @grid[8] == str
      return str
    end
    ################
    if @grid[0] == str && @grid[3] == str && @grid[6] == str
      return str
    end
    if @grid[1] == str && @grid[4] == str && @grid[7] == str
      return str
    end
    if @grid[2] == str && @grid[5] == str && @grid[8] == str
      return str
    end
    ################
    if @grid[0] == str && @grid[4] == str && @grid[8] == str
      return str
    end
    if @grid[2] == str && @grid[4] == str && @grid[6] == str
      return str
    end
  end
end


# Run the game
new_game = TicTacToe.new
