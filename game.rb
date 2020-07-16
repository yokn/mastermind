# frozen_string_literal: true

require_relative 'player'
require_relative 'human_player'
require_relative 'ai_player'
require_relative 'board'

class Game
  def initialize
    @board = Board.new
    @human_player = HumanPlayer.new
    @ai_player = AIPlayer.new
  end

  def setup_game
    puts '~~~Mastermind~~~'
    determine_gm
    play_game
  end

  def determine_gm
    puts 'Do you want be to the game master? (true/false)'
    @player_is_gm = gets.chomp
    @player_is_gm = @player_is_gm == 'true'
    @ai_player.create_code unless @player_is_gm
  end

  def play_game
    until game_over?
      get_guess
      p 'got guess'
      @board.display_board
      game_over?
    end
  end

  def get_guess
    if @player_is_gm
      @ai_player.get_ai_guess
      p 'placeholder'
    else
      @human_player.get_human_guess
    end
  end

  def check_win
    puts 'checking win'
    # win if @guesses.any == @code
  end

  def game_over?
    check_win || @board.full?
  end
end
