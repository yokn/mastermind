# frozen_string_literal: true

class HumanPlayer < Player
  def initialize; end

  def create_code
    puts 'Please create a 4 digit code (yellow/blue/purple/red/green/cyan)'
    @code = gets.chomp.split
  end

  def get_human_guess
    puts 'Please enter your guess, 4 colors with a space between each one
(yellow/blue/purple/red/green/cyan)'
    gets.chomp
  end
end
