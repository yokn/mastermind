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
    @code = @player_is_gm ? @human_player.create_code : @ai_player.create_code
    # @code = %w[red cyan red red]
    p @code
  end

  def play_game
    until game_over?
      get_guess
      puts 'got guess'
      @board.add_guess_to_board_array(@guess)
      @board.display_board
      puts "Attempts left: #{12 - @board.guess_count}!"
    end
    puts 'Game over!'
  end

  def get_guess
    @guess = nil
    @guess = if @player_is_gm
               @ai_player.get_ai_guess
             else
               @human_player.get_human_guess.split
             end
    p @guess
  end

  def check_guess(guess)
    @flag = []
    @perfect_match = 0
    @color_match = 0
    @code.each_with_index do |value, index|
      check_perfect_match(value, guess, index)
    end
    @code.each_with_index do |value, index|
      check_color_match(value, guess, index)
    end
    p @flag
    puts "Perfect match: #{@perfect_match}"
    puts "Color match: #{@color_match}"
    true if @perfect_match == 4
  end

  def check_perfect_match(value, guess, index)
    @found_match = false
    puts "value: #{value} guess: #{guess} index: #{index}"
    if guess[index] == value
      @perfect_match += 1
      puts "Found perfect match: #{value} at #{index}"
      @flag[index] = 'perfect'
      @found_match = true
    end
    @found_match
  end

  # no duplicates... i think?
  # https://stackoverflow.com/a/2005808
  def check_color_match(value, guess, index)
    # p value
    # p guess
    # p index
    puts "value: #{value} guess: #{guess} index: #{index}"
    4.times do |s|
      next unless s != index && guess[index] == @code[s] && !(@flag[s] == 'perfect' || @flag[index] == 'perfect')

      # guess.delete_at(guess.index(@code[s]))
      @color_match += 1
      @flag[s] = 'color'
      puts "Found color match: #{value} at #{s}"
      break
    end
  end

  # def remove_duplicates
  #   4.times do |x|
  #     if @flag[x] = 1
  # end
  def game_over?
    check_guess(@guess) || @board.full? unless @guess.nil?
  end
end
