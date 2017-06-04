require 'test_helper'

class RateCalculatorTest < Minitest::Test
  def test_calculate_returns_something
    assert FxPotato::RateCalculator.calculate(0.84, 91.44)
  end

  def test_calculate_returns_correct_rate
    assert_equal 2, FxPotato::RateCalculator.calculate(1, 2)
    assert_equal 108.85714285714286, FxPotato::RateCalculator.calculate(0.84, 91.44)
  end

  def test_calculate_returns_nil_for_bad_inputs
    assert_nil FxPotato::RateCalculator.calculate(nil, 2)
    assert_nil FxPotato::RateCalculator.calculate(2, nil)
    assert_nil FxPotato::RateCalculator.calculate("nil", 2)
    assert_nil FxPotato::RateCalculator.calculate(2, [])
    assert_nil FxPotato::RateCalculator.calculate({}, 4)
    assert_nil FxPotato::RateCalculator.calculate(4, false)
  end
end
