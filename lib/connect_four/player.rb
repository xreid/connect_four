module ConnectFour
  class Player
    attr_accessor :name, :checker

    def initialize(name, checker = nil)
      @name = name
      @checker = checker
    end

    def to_s
      @name.to_s.colorize(@checker.color)
    end
  end
end
