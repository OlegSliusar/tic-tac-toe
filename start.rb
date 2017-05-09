require_relative 'lib/tic_tac_toe'

game = TicTacToe.new

loop do
  until game.victory
    game.show_current_board
    print "Player #{game.players_turn}, enter your move: "
    game.move(gets)
  end
  game.show_current_board
  puts "Player #{game.victory} wins!"
  print "\n"
  print "Play again? (y/n) "
  answer = gets.strip
  if answer == "y"
    puts "#" * 90
    game = TicTacToe.new
  else
    break
  end
end
