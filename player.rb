# frozen_string_literal: true

class Player
  def initialize; end

  def get_random_color
    @rand = rand
    if @rand.between?(0, 0.16)
      'yellow'
    elsif @rand.between?(0.16, 0.32)
      'blue'
    elsif @rand.between?(0.32, 0.48)
      'purple'
    elsif @rand.between?(0.48, 0.64)
      'red'
    elsif @rand.between?(0.64, 0.80)
      'green'
    elsif @rand.between?(0.80, 1)
      'cyan'
      # else
      #   "can't get color"
    end
  end
end
