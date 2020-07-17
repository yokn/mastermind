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
      puts 'got guess'
      @board.display_board
      # game_over?
    end
    puts 'Game over!'
  end

  def get_guess
    @guess = nil
    if @player_is_gm
      @guess = @ai_player.get_ai_guess
      puts 'placeholder'
    else
      @guess = @human_player.get_human_guess.split
    end
    p @guess
  end

  def check_guess(guess)
    @correct_color_and_position = 0
    puts 'checking if guess was correct'
    guess.each_with_index do |_value, index|
      if guess[index] == @ai_player.code[index]
        @correct_color_and_position += 1
        p 'placeholder111111111111111111'
      end
    end
    puts "Correct color and position: #{@correct_color_and_position}"
    true if @correct_color_and_position == 4
  end

  def game_over?
    check_guess(@guess) || @board.full? unless @guess.nil?
  end
end
