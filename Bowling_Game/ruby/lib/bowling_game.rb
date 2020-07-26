# frozen_string_literal: true

require 'byebug'

# responsible for implementing Bowling Game rules
class BowlingGame
  def pins(rolls)
    @rolls = rolls
  end

  def score
    score = 0
    frame_index = 0
    10.times do
      score += score_frame(frame_index)
      frame_index = next_frame(frame_index)
    end
    score
  end

  private

  attr_reader :rolls

  def strike?(index)
    rolls[index] == 10
  end

  def spare?(index)
    return false if strike?(index)

    (rolls[index] + rolls[index + 1]) == 10
  end

  def score_frame(index)
    return 10 + strike_bonus(index) if strike?(index)
    return 10 + spare_bonus(index) if spare?(index)

    standard_score(index)
  end

  def standard_score(index)
    rolls[index, 2].inject(:+)
  end

  def spare_bonus(index)
    rolls[index + 2]
  end

  def strike_bonus(index)
    rolls[index + 1, 2].inject(:+)
  end

  def next_frame(index)
    return index + 1 if strike?(index)

    index + 2
  end
end
