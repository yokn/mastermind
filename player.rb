# frozen_string_literal: true

class Player
  def initialize; end

  def get_random_color
    @rand = rand
    if @rand.between?(0, 0.17)
      'yellow'
    elsif @rand.between?(0.17, 0.33)
      'blue'
    elsif @rand.between?(0.33, 0.49)
      'purple'
    elsif @rand.between?(0.49, 0.65)
      'red'
    elsif @rand.between?(0.65, 0.81)
      'green'
    else
      'cyan'
    end
  end
end
