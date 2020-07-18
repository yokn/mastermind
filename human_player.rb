# frozen_string_literal: true

class HumanPlayer < Player
  def initialize; end

  def create_code
    puts 'Please enter a 4 digit code (yellow/blue/purple/red/green/cyan)'
    @code = gets.chomp.split
  end

  def get_human_guess
    puts 'Please enter your guess'
    gets.chomp
  end
end
