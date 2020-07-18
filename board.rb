# frozen_string_literal: true

class Board
  attr_reader :guess_count
  def initialize
    @guesses = 'placeholder'
    @board_array = Array.new(12, '-       -        -        -       ')
    @guess_count = 0
  end

  def add_guess_to_board_array(guess)
    @board_array[@guess_count] = guess
    @guess_count += 1
  end

  def display_board
    puts <<-HEREDOC
   #{@board_array[0]}
   #{@board_array[1]}
   #{@board_array[2]}
   #{@board_array[3]}
   #{@board_array[4]}
   #{@board_array[5]}
   #{@board_array[6]}
   #{@board_array[7]}
   #{@board_array[8]}
   #{@board_array[9]}
   #{@board_array[10]}
   #{@board_array[11]}
    HEREDOC
  end

  def full?
    @guess_count > 11
  end
end
