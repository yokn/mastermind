# frozen_string_literal: true

class AIPlayer < Player
  attr_reader :code
  def initialize
    @code = nil
  end

  def create_code
    @code = []
    4.times do |_x|
      @code.push(get_random_color)
    end
    p @code
  end

  def get_ai_guess
    (1..4).each do |_i|
      case rand
      when 0.2
        'yellow'
      end
    end
  end
end
