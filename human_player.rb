# frozen_string_literal: true

class HumanPlayer < Player
  def initialize; end

  def get_human_guess
    puts 'Please enter your guess'
    gets.chomp
  end
end
