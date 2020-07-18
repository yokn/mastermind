# frozen_string_literal: true

class AIPlayer < Player
  def initialize
    @ai_guess = []
  end

  def create_code
    @code = []
    4.times do |_x|
      @code.push(get_random_color)
    end
    @code
  end

  def get_ai_guess
    4.times do |_i|
      @ai_guess.push(get_random_color)
      p @ai_guess
    end
    @ai_guess
  end
end
