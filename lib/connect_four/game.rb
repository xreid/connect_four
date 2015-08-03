module ConnectFour
  class Game
    attr_reader :players, :board
    BLANK_SPACE  = '⬤ '

    def initialize(players, board = Board.new)
      @players = players
      @board   = board
    end

    def play(player, column)
      column -= 1
      fail ColumnFullError unless @board.columns[column].any? { |checker| checker == BLANK_SPACE }
      (@board.height - 1).downto 0 do |index|
        if @board.spaces[index][column] == BLANK_SPACE
          @board.spaces[index][column] = player.checker
          break
        end
      end
    end

    def over?
      @board.full? || winner
    end

    def winner
      @board.check(:rows)    ||
      @board.check(:columns) ||
      @board.check(:diagonals)
    end
  end
end
