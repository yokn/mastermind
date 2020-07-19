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

  def get_ai_guess(perfect_match, _color_match)
    (4 - perfect_match).times do |_i|
      @ai_guess.pop
    end
    (4 - perfect_match).times do |_i|
      @ai_guess.push(get_random_color)
    end
    # p @ai_guess
    @ai_guess
  end
end
