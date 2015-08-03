require 'colorize'

module ConnectFour
  class ColumnFullError < StandardError
    def message
      'This column is full. Pleas try another.'.light_red
    end
  end

  class InvalidColumnError < StandardError
    def message
      'Please enter a digit (1-7) to select a column.'.light_red
    end
  end
end
