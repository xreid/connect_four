require 'colorize'

module ConnectFour
  class Checker
    attr_accessor :color, :owner

    def initialize(color, owner = nil)
      @color = color
      @owner = owner
    end

    def to_s
      '⬤ '.colorize(@color)
    end
  end
end
