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
    puts 'Do you want be the game master? (true/false)'
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
    @flag = []
    @perfect_match = 0
    @color_match = 0
    @ai_player.code.each_with_index do |value, index|
      check_color_match(value, guess, index) unless check_perfect_match(value, guess, index)
      # remove_duplicate_matches
    end
    puts "Perfect match: #{@perfect_match}"
    puts "Color match: #{@color_match}"
    true if @perfect_match == 4
  end

  def check_perfect_match(value, guess, index)
    @found_match = false
    if guess[index] == value
      @perfect_match += 1
      puts "Found perfect match: #{value}"
      @flag[index] = 1
      @found_match = true
    end
    @found_match
  end

  # https://stackoverflow.com/a/2005808
  def check_color_match(value, guess, index)
    guess.each_with_index do |inner_value, inner_index|
      if inner_index != index && inner_value == value && !@flag[inner_index]
        @color_match += 1
        @flag[inner_index] = 1
      end
    end
  end

  # def remove_duplicate_matches
  #   @@abc = (@perfect_match > @color_match ? @color_match : @perfect_match) - @perfect_match
  # end

  def game_over?
    check_guess(@guess) || @board.full? unless @guess.nil?
  end
end
