require 'tic_tac_toe'

describe TicTacToe do
  before(:each) do
    @game = TicTacToe.new
  end

  describe '#victory' do
    context 'X wins' do
      def make_moves_and_x_wins(moves)
        @game.players_turn = 'X'
        moves.each do |location|
          @game.move(location)
        end
        expect(@game.victory).to eq('X')
      end

      it 'on the top row' do
        moves = ["a1", "b1", "a2", "b2", "a3"]
        make_moves_and_x_wins(moves)
      end

      it 'on the middle row' do
        moves = ["b1", "c1", "b2", "c2", "b3"]
        make_moves_and_x_wins(moves)
      end

      it 'on the low row' do
        moves = ["c1", "b1", "c2", "b2", "c3"]
        make_moves_and_x_wins(moves)
      end

      it 'on the first column' do
        moves = ["a1", "a2", "b1", "b2", "c1"]
        make_moves_and_x_wins(moves)
      end

      it 'on the second column' do
        moves = ["a2", "a3", "b2", "b3", "c2"]
        make_moves_and_x_wins(moves)
      end

      it 'on the third column' do
        moves = ["a3", "a2", "b3", "b2", "c3"]
        make_moves_and_x_wins(moves)
      end

      it 'on first diagonal' do
        moves = ["a1", "a2", "b2", "a3", "c3"]
        make_moves_and_x_wins(moves)
      end

      it 'on second diagonal' do
        moves = ["a3", "a2", "b2", "a1", "c1"]
        make_moves_and_x_wins(moves)
      end
    end

    context 'O wins when it doesn\'t start the game' do
      def make_moves_and_o_wins(moves)
        @game.players_turn = 'X'
        moves.each do |location|
          @game.move(location)
        end
        expect(@game.victory).to eq('O')
      end

      it 'O wins on the top row' do
        moves = ["c1", "a1", "b1", "a2", "b2", "a3"]
        make_moves_and_o_wins(moves)
      end

      it 'O wins on the middle row' do
        moves = ["a1", "b1", "c1", "b2", "c2", "b3"]
        make_moves_and_o_wins(moves)
      end

      it 'O wins on the low row' do
        moves = ["a1", "c1", "b1", "c2", "b2", "c3"]
        make_moves_and_o_wins(moves)
      end

      it 'O wins on the first column' do
        moves = ["a3", "a1", "a2", "b1", "b2", "c1"]
        make_moves_and_o_wins(moves)
      end

      it 'O wins on the second column' do
        moves = ["a1", "a2", "a3", "b2", "b3", "c2"]
        make_moves_and_o_wins(moves)
      end

      it 'O wins on the third column' do
        moves = ["a1", "a3", "a2", "b3", "b2", "c3"]
        make_moves_and_o_wins(moves)
      end

      it 'O wins on first diagonal' do
        moves = ["c1", "a1", "a2", "b2", "a3", "c3"]
        make_moves_and_o_wins(moves)
      end

      it 'O wins on second diagonal' do
        moves = ["b1", "a3", "a2", "b2", "a1", "c1"]
        make_moves_and_o_wins(moves)
      end
    end

    context 'Draw' do
      def make_moves_and_draw(moves)
        @game.players_turn = 'X'
        moves.each do |location|
          @game.move(location)
        end
        expect(@game.victory).to eq('Draw!')
      end

      it 'runs in a draw' do
        moves = ['c3', 'b2', 'a1', 'b1', 'b3', 'a3', 'a2', 'c2', 'c1']
        make_moves_and_draw(moves)
      end
    end

  end
end
