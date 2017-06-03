require 'test_helper'

class RateCalculatorTest < Minitest::Test
  def test_calculate_returns_something
    assert FxPotato::RateCalculator.calculate(0.84, 91.44)
  end
end
