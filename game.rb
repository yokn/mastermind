# frozen_string_literal: true

require_relative 'player'
require_relative 'human_player'
require_relative 'ai_player'
require_relative 'board'

class Game
  def initialize; end

  def setup_game; end

  def determine_gamemaster; end

  def play_game
    get_guess
    check_win
  end

  def get_guess
    abc if ai
  end

  def check_win
    win if @guesses.any == @code
  end

  def game_over?; end
end
