module ConnectFour
  class Board
    attr_reader :height, :width, :spaces
    BLANK_SPACE = '⬤ '

    def initialize(checker = BLANK_SPACE)
      @height = 6
      @width  = 7
      @spaces = [
        [checker, checker, checker, checker, checker, checker, checker],
        [checker, checker, checker, checker, checker, checker, checker],
        [checker, checker, checker, checker, checker, checker, checker],
        [checker, checker, checker, checker, checker, checker, checker],
        [checker, checker, checker, checker, checker, checker, checker],
        [checker, checker, checker, checker, checker, checker, checker]
      ]
    end

    def draw
      puts "\n"
      @spaces.each do |row|
        row.each { |checker| print checker }#== BLANK_SPACE ? checker : BLANK_SPACE.colorize(checker) }
        puts "\n"
      end
      puts "1 2 3 4 5 6 7\n"
    end

    def rows
      @spaces
    end

    def columns
      [
        [@spaces[5][0], @spaces[4][0], @spaces[3][0], @spaces[2][0], @spaces[1][0], @spaces[0][0]],
        [@spaces[5][1], @spaces[4][1], @spaces[3][1], @spaces[2][1], @spaces[1][1], @spaces[0][1]],
        [@spaces[5][2], @spaces[4][2], @spaces[3][2], @spaces[2][2], @spaces[1][2], @spaces[0][2]],
        [@spaces[5][3], @spaces[4][3], @spaces[3][3], @spaces[2][3], @spaces[1][3], @spaces[0][3]],
        [@spaces[5][4], @spaces[4][4], @spaces[3][4], @spaces[2][4], @spaces[1][4], @spaces[0][4]],
        [@spaces[5][5], @spaces[4][5], @spaces[3][5], @spaces[2][5], @spaces[1][5], @spaces[0][5]],
        [@spaces[5][6], @spaces[4][6], @spaces[3][6], @spaces[2][6], @spaces[1][6], @spaces[0][6]]
      ]
    end

    def diagonals
      [
        [@spaces[3][0], @spaces[2][1], @spaces[1][2], @spaces[0][3]],
        [@spaces[4][0], @spaces[3][1], @spaces[2][2], @spaces[1][3], @spaces[0][4]],
        [@spaces[5][0], @spaces[4][1], @spaces[3][2], @spaces[2][3], @spaces[1][4], @spaces[0][5]],
        [@spaces[5][1], @spaces[4][2], @spaces[3][3], @spaces[2][4], @spaces[1][5], @spaces[0][6]],
        [@spaces[5][2], @spaces[4][3], @spaces[3][4], @spaces[2][5], @spaces[1][6]],
        [@spaces[5][3], @spaces[4][4], @spaces[3][5], @spaces[2][6]]
      ]
    end

    def full?
      @spaces.all? { |row| row.all? { |space| space != BLANK_SPACE } }
    end

    def check(scope)
      case scope
        when :rows      then scope = rows
        when :columns   then scope = columns
        when :diagonals then scope = diagonals
      end
      checkers = []
      scope.each do |segment|
        segment.each do |checker|
          return checkers[0] if checkers.size >= 4
          if checker != BLANK_SPACE
            checkers.empty? || checkers[0] == checker ? checkers << checker : checkers = []
          else
            checkers = []
          end
        end
      end
      false
    end
  end
end
