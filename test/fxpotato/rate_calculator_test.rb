require 'test_helper'

class RateCalculatorTest < Minitest::Test
  def test_calculate_returns_something
    assert FxPotato::RateCalculator.calculate(0.84, 91.44)
  end

  def test_calculate_returns_correct_rate
    assert FxPotato::RateCalculator.calculate(1, 2) == 2
  end
end
