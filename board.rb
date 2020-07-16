# frozen_string_literal: true

class Board
  def initialize
    @guesses = 'placeholder'
  end

  def display_board
    puts 'displaying board'
    puts '----------------'
    puts '                '
    puts '----------------'
  end

  def full?; end
end
