module ConnectFour
  describe Game do
    describe '#new' do
      let(:game) { Game.new([:Sampha]) }
      it 'creates a new game' do
        expect(game).to be_a Game
      end
      it 'assigns players to the game' do
        expect(game.players).to eq [:Sampha]
      end
      it 'assigns a board to the game' do
        expect(game.board).to be_a Board
      end
    end

    describe '#play' do
      it "sets the first blank checker in the column to the player's checker" do
        board = Board.new.spaces
        sampha = Player.new(:Sampha, :red)
        jon = Player.new(:Jon, :blue)
        board[5][0] = sampha.checker
        game = Game.new [sampha]
        game.play(sampha, 1)
        expect(game.board.spaces).to eq board
        game.play(sampha, 1)
        board[4][0] = sampha.checker
        expect(game.board.spaces).to eq board
        game.play(jon, 1)
        board[3][0] = jon.checker
        expect(game.board.spaces).to eq board
      end
      context 'when the column is full' do
        game = Game.new([:Sampha, :Jon], Board.new('x'))
        it 'raises an exception' do
          expect { game.play(Player.new(:Sampha, :red), 4) }.to raise_error ColumnFullError
        end
      end
    end

    describe '#over?' do
      let(:game) { Game.new([:Sampha, :Jon]) }
      subject { game.over? }

      context 'when the board is full' do
        it do
          allow(game.board).to receive(:full?).and_return true
          is_expected.to be_truthy
        end
      end
      context 'when there is a winner' do
        it do
          allow(game).to receive(:winner).and_return true
          is_expected.to be_truthy
        end
      end
      context 'when there is no winner and the board is not full' do
        it { is_expected.to be_falsey }
      end
    end

    describe '#winner' do
      players = [Player.new(:Sampha, :red), Player.new(:Jon, :blue)]
      let(:game) { Game.new(players) }
      subject { game.winner }

      context 'when there is a winner' do
        it do
          allow(game.board).to receive(:check).and_return true
          is_expected.to be_truthy
        end
      end
      context 'when there is not a winner' do
        it do
          allow(game.board).to receive(:check).and_return false
          is_expected.to be_falsey
        end
      end
    end
  end
end
