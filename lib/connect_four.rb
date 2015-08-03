require_relative 'connect_four/version'
require_relative 'connect_four/checker'
require_relative 'connect_four/player'
require_relative 'connect_four/board'
require_relative 'connect_four/game'
require_relative 'connect_four/exceptions'

require 'colorize'

module ConnectFour
  def self::welcome
    puts "\nWelcome to Command Line Connect Four!"
    printf 'Player 1 name: '
    p1_name  = gets.chomp.gsub(/[^a-zA-Z]/, '').to_sym
    p1_checker = Checker.new(:light_magenta)
    player_1 = Player.new(p1_name, p1_checker)
    p1_checker.owner = player_1

    printf 'Player 2 name: '
    p2_name  = gets.chomp.gsub(/[^a-zA-Z]/, '').to_sym
    p2_checker = Checker.new(:light_cyan)
    player_2 = Player.new(p2_name, p2_checker)
    p2_checker.owner = player_1
    [player_1, player_2]
  end

  def self::get_choice(player)
    column = 0
    begin
      printf "#{player.name.to_s.colorize(player.checker.color)}, choose a column: "
      column = gets.chomp.to_i
      fail InvalidColumnError unless (1..7).include? column
    rescue StandardError => error
      puts error.message
      retry
    end
    column
  end

  def self::start(players = ConnectFour.welcome)
    game = Game.new(players)
    turn = 0
    until game.over?
      game.board.draw
      player = game.players[turn % 2]
      begin
        column = ConnectFour.get_choice(player)
        game.play(player, column)
      rescue StandardError => error
        puts error.message
        retry
      end
      turn += 1
    end
    game.board.draw
    if game.winner
      winner = game.winner.owner
      puts "#{winner} Won!"
    else
      puts "\nIt's a Draw!"
    end
    printf 'Play Again? y/n: '
    ConnectFour.start players if gets.chomp.downcase == 'y'
  end
end
