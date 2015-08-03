module ConnectFour
  describe Board do
    let(:board) { Board.new }
    spaces = Array.new(6, Array.new(7, '⬤ '))

    describe '#new' do
      it 'creates a new Board' do
        expect(board).to be_a ConnectFour::Board
      end
      it 'sets the height of the board to 6' do
        expect(board.height).to eq 6
      end
      it 'sets the width of the board to 7' do
        expect(board.width).to eq 7
      end
      it 'creates an array of blank spaces' do
        expect(board.spaces).to eq spaces
      end
    end

    describe '#full?' do
      context 'when the board is full' do
        it 'returns true ' do
          expect(Board.new(:red).full?).to be_truthy
        end
      end
      context 'when the board is not full' do
        it 'returns false ' do
          expect(Board.new.full?).to be_falsey
        end
      end
    end

    describe '#check' do
      let(:board) { Board.new }
      test_board_truthy = [
        ['⬤ ', '⬤ ', '⬤ ', '⬤ ', '⬤ ', '⬤ ', '⬤ '],
        ['⬤ ', '⬤ ', '⬤ ', '⬤ ', '⬤ ', '⬤ ', '⬤ '],
        ['⬤ ', '⬤ ', '⬤ ', '⬤ ', '⬤ ', '⬤ ', '⬤ '],
        ['⬤ ', '⬤ ', '⬤ ', '⬤ ', '⬤ ', '⬤ ', '⬤ '],
        ['⬤ ',  'x ',  'x ',  'x ', 'x ', '⬤ ', '⬤ '],
        ['⬤ ', '⬤ ', '⬤ ', '⬤ ', '⬤ ', '⬤ ', '⬤ ']
      ]
      test_board_falsey = [
        ['x ',  'y ',  'x ',  'x ', 'y ', '⬤ ', 'x '],
        ['x ', '⬤ ', '⬤ ', '⬤ ', '⬤ ', '⬤ ', 'x '],
        ['x ', '⬤ ', '⬤ ', '⬤ ', '⬤ ', 'x ', '⬤ '],
        ['x ', '⬤ ', '⬤ ', '⬤ ', 'x ', '⬤ ', '⬤ '],
        ['x ',  'x ', '⬤ ',  'x ', 'x ', '⬤ ', '⬤ '],
        ['x ', '⬤ ', '⬤ ', '⬤ ', '⬤ ', '⬤ ', '⬤ ']
      ]

      context 'when there is a winning row' do
        it 'returns a truthy value' do
          allow(board).to receive(:rows).and_return test_board_truthy
          expect(board.check(:rows)).to be_truthy
        end
      end
      context 'when there is a winning column' do
        it 'returns a truthy value' do
          allow(board).to receive(:columns).and_return test_board_truthy
          expect(board.check(:columns)).to be_truthy
        end
      end
      context 'when there is a winning diagonal' do
        it 'returns a truthy value' do
          allow(board).to receive(:diagonals).and_return test_board_truthy
          expect(board.check(:diagonals)).to be_truthy
        end
      end
      context 'when there are no winning rows' do
        it 'returns a falsey value' do
          allow(board).to receive(:rows).and_return test_board_falsey
          expect(board.check(:rows)).to be_falsey
        end
      end
      context 'when there are no winning columns' do
        it 'returns a falsey value' do
          allow(board).to receive(:columns).and_return test_board_falsey
          expect(board.check(:columns)).to be_falsey
        end
      end
      context 'when there are no winning diagonals' do
        it 'returns a falsey value' do
          allow(board).to receive(:diagonals).and_return test_board_falsey
          expect(board.check(:diagonals)).to be_falsey
        end
      end
    end
  end
end
